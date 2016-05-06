#!/usr/bin/env sh

start() {
    docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll -it -p $(dlite ip):4000:4000 jekyll/jekyll:pages jekyll serve --watch --force_polling
}

case "$1" in
	  start)
		   start 
		    ;;
	  *)
		    echo $"Usage: $0 {start}"
		    exit 1
esac
