---
layout: post
title: "Blogging with Spacemacs and Jekyll"
tags: 
  - jekyll
  - blogging
  - spacemacs
  - emacs
---

I use Emacs with [Spacemacs](http://spacemacs.org/) configuration kit. These are some of my notes on setting it up to work with this jekyll blog. 

## Installing the spacemacs jekyll layer

This utilizes a configuration layer to work with a spacemacs-ified [Hyde](https://github.com/nibrahim/Hyde), an excellent jekyll management interface for Emacs.  

Assuming you have [spacemacs](http://spacemacs.org/) installed and set up, you can just clone the `jekyll` layer I put together as one of your private layers: 

``` shell
git clone https://github.com/0x414A/spacemacs-jekyll ~/.emacs.d/private/jekyll
```

Then, set add `jekyll` to your `dotspacemacs-configuration-layers`:

``` emacs-lisp
  (setq-default dotspacemacs-configuration-layers '(jekyll))
```

When you reload your spacemacs configuration with <kbd>SPC f e R</kbd>, Hyde will be installed.

## Configuration 

Hyde looks for a `.hyde.el` in the root of your blog directory, so you'll need to add a `.hyde.el` there. 

This is what mine looks like for this blog:

``` emacs-lisp
(setq hyde/git/remote "upstream" ; The name of the remote to which we should push
      hyde/git/remote "master"   ; The name of the branch on which your blog resides
      )
```

You'll need to exclude this from jekyll's output in `_config.yml`:

``` yaml
exclude: [Gemfile, Gemfile.lock, README.md, vendor, org, .hyde.el]
```

## Usage

This layer adds a global <kbd>SPC a j</kbd> that will prompt you as to where your Jekyll blog source is locally. 

![Hyde initial view](https://cloud.githubusercontent.com/assets/6130766/15062690/3a5b7d4e-1308-11e6-8db5-ab9ee74951fa.png)

Then, you'll be brought to this screen:

![Hyde main view](https://cloud.githubusercontent.com/assets/6130766/15062693/3fcc0be0-1308-11e6-94e2-f72d689bfd5f.png)

You can bring this up any time you're in your blog's source directory with <kbd>SPC a j</kbd>. 

From there you can create a new draft post by pressing <kbd>n</kbd>.

For more on the keybindings, read [here](https://github.com/0x414A/spacemacs-jekyll#key-bindings).
