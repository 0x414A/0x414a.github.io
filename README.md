# What dis?

This is the source code for my [blog](https://allysonjulian.com/).


## Previewing

I preview the site using the official `jekyll/jekyll:pages` docker image, which replicates GitHub Pages' jekyll stack.

```
docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll -it -p 127.0.0.1:4000:4000 jekyll/jekyll:pages
```
