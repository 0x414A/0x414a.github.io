# What dis?

This is the source code for my [blog](https://allysonjulian.com/).


## Previewing

I preview the site using the official `jekyll/jekyll:pages` docker image, which replicates GitHub Pages' jekyll stack.

### On Linux:

```
docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll -it -p 127.0.0.1:4000:4000 jekyll/jekyll:pages
```

Then go to http://localhost:4000

### On OS X (with [dlite](https://github.com/nlf/dlite)):

```
docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll -it -p $(dlite ip):4000:4000 jekyll/jekyll:pages
```

Then go to http://local.docker:4000
