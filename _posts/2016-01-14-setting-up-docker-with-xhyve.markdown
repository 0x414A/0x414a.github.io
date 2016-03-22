---
layout: post
title: Setting up docker with xhyve
date: 2016-01-14 18:18:58.000000000 +00:00
tags: 
  - xhyve
  - osx
  - docker
---

* TOC
{:toc}

*An alternative* You can skip all this and check out [dlite](https://github.com/nlf/dlite), which integrates `xhyve` with docker without going through the hassle of dealing with `docker-machine` and fiddling with environment variable shenanigans. I've since switched to that over `docker-machine-driver-xhyve`.

--------

One of the pain points I have had with using `docker` on OS X is that performance can take a hit due to needing a Type 2 hypervisor (which runs more like a regular program that doesn't have direct access to hardware) to work (e.g. virtualbox, VMWare). 

Here's where [xhyve](https://github.com/mist64/xhyve) comes in. xhyve takes advantage of the `Hypervisor.framework` that was introduced in OS X 10.10, which brings Type 1 hypervisor technology (direct, host-level access to hardware) to OS X. @mist64, the main author of xhyve has an [excellent introduction](http://www.pagetable.com/?p=831) written up on it.

As this is all very new technology, I did not find many guides on how to use `xhyve` with my `docker` workflow, so I've written up my notes here.

## docker with xhyve

A solution I've been using to get that takes advantage of @zchee's [docker-machine-driver-xhyve](https://github.com/zchee/docker-machine-driver-xhyve).

I've used to solution to replace my previous, virtualbox-driven docker workflow.

# Before you begin
 
If you have a previous installation of the `docker` toolset, whether through Docker Toolbox or homebrew, you'll need to uninstall them all.

You can use docker's own uninstall script:

```
sh -c "$(curl -fsSl https://raw.githubusercontent.com/docker/toolbox/master/osx/uninstall.sh)"
```

If you installed docker with homebrew, uninstall `docker`, `docker-compose`, `docker-machine`:

```
brew uninstall docker docker-compose docker-machine
```

# The tools

All of these can be installed without `homebrew`, but I'm too lazy to go over that. 

The tools:

- docker (homebrew) v1.9.x
- docker-compose (homebrew) v1.5.x
- docker-machine (from source or binary)
- docker-machine-driver-xhyve (from source or binary)
- xhyve (homebrew)

# Installation (Automated)

**BEWARE** Dragons here.

I've attempted to automate this process with a  [script](https://gist.github.com/0x414A/0d5303b787a449cd564f), but YMMV.

# Installation (binaries)

**UPDATED** 06/01/2016 - @nathanleclaire pointed out that there are binaries of `docker-machine-driver-xhyve` [here](https://github.com/zchee/docker-machine-driver-xhyve/releases). Not sure how I missed that before, but I've updated this to account for the pre-compiled binaries. :)

--

Install the `docker` toolset:

```
brew update
brew install docker docker-compose docker-machine
```

You'll then need to change permissions for the `docker-machine-driver-xhyve` binary:

```
sudo chown root:wheel /usr/local/bin/docker-machine-driver-xhyve
sudo chmod u+s /usr/local/bin/docker-machine-driver-xhyve
```

See the [releases](https://github.com/zchee/docker-machine-driver-xhyve/releases/latest) page for installation without home-brew.

# Manual Installation (from source)

## Installing dependencies

`docker-machine-driver-xhyve` and `docker-machine` both require `go`, so you will need to install `go` alongside `docker`, `docker-compose`, and `xhyve`. We will be building `docker-machine` from source.

```
brew update
brew install xhyve docker go
brew install docker-compose --without-docker ---without-docker-machine
```

Then, set up the `$GOPATH` which will be necessary to proceed:

```
mkdir ~/.go
export GOPATH=~/.go
```

## Installing docker-machine

Retrieve the `docker-machine` source and then build and install:

```
go get github.com/docker/machine
cd $GOPATH/src/github.com/docker/machine
make build
make install # this will copy the bin to /usr/local/bin
```

## Installing docker-machine-driver-xhyve

Retrieve the `docker-machine-driver-xhyve` source and then build and install that:

```
export GO15VENDOREXPERIMENT=1
go get -u github.com/zchee/docker-machine-driver-xhyve
cd $GOPATH/src/github.com/zchee/docker-machine-driver-xhyve
make build
make install
sudo chown root:wheel $GOPATH/bin/docker-machine-driver-xhyve
sudo chmod u+s $GOPATH/bin/docker-machine-driver-xhyve
```

# Creating the xhyve docker-machine

**NOTE** I had to temporarily turn off the OS X Firewall in order for this to work and to disconnect from any active VPNs. 

---

Assuming things went smoothly (let's hope), we can now proceed to creating the xhyve docker-machine. Hooray!

```
docker-machine create dev --driver xhyve --xhyve-experimental-nfs-share
```

This will create a docker-machine running on xhyve, and then set up a tinycorelinux-based boot2docker VM.

![docker-machine](http://i.imgur.com/4kuxr6h.png)

I'd recommend having the `--xhyve-experimental-nfs-share` argument passed if you want to mount shared volumes. This will mount `/Users` as an NFS folder in the `tinycorelinux` environment that `docker` on OS X needs.

If you have an existing `/etc/exports` (used to configure NFS on OS X), temporarily move it to `/etc/exports` as the NFS setup by this docker-machine driver will not work otherwise.

```
sudo mv /etc/exports{,.backup}
```

NOTE: if you are using a VPN, turn it off before using this step. 

# Testing

Try running the [hello world](https://docs.docker.com/engine/userguide/dockerizing/) docker example:

![hello world](http://i.imgur.com/aQKfhym.png)

# Hacking away

I've successfully used this on projects that use multiple containers without having to change any configuration in `docker-compose.yml`.


