#!/usr/bin/env sh


start() {
    if [[ `uname` == 'Darwin' ]]; then
        echo "Starting server for OS X"
        docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll -it -p $(dlite ip):4000:4000 jekyll/jekyll:pages jekyll serve --watch --force_polling
    else
        echo "Starting server for Linux"
        docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll -it -p 127.0.0.1:4000:4000 jekyll/jekyll:pages jekyll serve --watch --drafts
    fi
}

case "$1" in
	  start)
		   start 
		    ;;
	  *)
		    echo $"Usage: $0 {start}"
		    exit 1
esac
