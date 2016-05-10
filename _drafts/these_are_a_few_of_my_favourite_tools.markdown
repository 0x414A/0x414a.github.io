---
layout: post
title: "These are a few of my favourite tools"
---

People, for whatever reason, are "wowed" and "impressed" by my setup. I am not entirely sure why, but since I promised myself I would contribute more posts, more frequently, here's my setup on OS X 10.11. 

### Configuration 

I used to be the type to take pride in their editor, shell configuration and maintained my own oh-my-zsh lite and spacemacs lite, even. At some point, I even used Gentoo. What kind of..??

But anyway, over time, I've become more and more averse to maintaining my own full configuration. That's where these configuration starters come in.

**emacs** [spacemacs](http://spacemacs.org) used to be specifically for having a usable `evil-mode`, but has since morphed into being an Emacs-on-steroids type of thing.

**zsh** [prezto](https://github.com/sorin-ionescu/prezto) is an alternative to `oh-my-zsh` that was recommended by its creator in [this](https://medium.freecodecamp.com/d-oh-my-zsh-af99ca54212c#.j2jtqjj65) post.

**vim** [spf13](http://vim.spf13.com/). Just for kicks, here's a `vim` configuration kit that I use for terminal vim.

### Fonts

You may be asking something like:

> But AJ, what's the difference? Aren't writing code and writing prose one and the same?

Yes, both code-writing and prose-writing involve long hours spent looking at streams of text, but I prefer to keep their contexts somewhat separate by using different fonts. Since I use Emacs for, well, everything, I have it toggle fonts:

**code** [M+ 1m](https://www.fontsquirrel.com/fonts/M-1m) also has a dashed rather than dotted 0 which I prefer.

![M+ 1m font](images/font1.png)

**writing** [Office Code Pro](https://github.com/nathco/Office-Code-Pro) 

![Office Code Pro](images/font2.png)

### Utilities 

**terminal emulator** [iTerm 2 Beta](http://iterm2.com/downloads.html) has excellent `tmux` support. With `tmux -CC` you can open tmux windows as native iTerm 2 tabs! 

![iterm2](images/iterm2.png)

**color picker** [Color Picker](https://itunes.apple.com/us/app/color-picker/id641027709?l=en&mt=12) by [NSCoding](http://nscoding.co.uk/). This is the best OS X Color Picker I've used.

![colorpicker](images/color_picker.png)

**markdown preview** [Marked 2](http://marked2app.com/) does a fantastic job of doing on-the-fly previews for Markdown files. It even brings you to the line that's been recently changed.

![marked2](images/marked2.png)

### Color Schemes

**iTerm 2** *Glacier*, part of [iTerm2-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes). This is one of my favourite color schemes for Sublime Text.

**Emacs** In spacemacs, you can toggle your color scheme with <kbd>SPC T n</kbd> and switch fairly easily between things. So I have 3 different themes enabled:

 - **code** *twilight-anti-bright* part of the spacemacs themes-megapack. For my inner Elliot Alderson, I like things dark and gloomy and crap.
 
![twilight-anti-bright](images/spacemacs.png) 
 
 - **org-mode** *leuven* This is made specifically to make org-mode buffers look extra fancy. I love it.
 
![leuven](images/leuven.png) 
 
 - **markdown-mode** *tao-yang* part of the themes-megapack. This looks the most like *iA Writer*, and used in conjunction with *writeroom-mode*, you pretty much have a nice, distraction-free markdown editor within Emacs.

![markdown-mode, writeroom-mode](images/writeroom-mode.png)

### Appearance

**icons** [LiteIcon](http://freemacsoft.net/liteicon/) lets you change icons for folders, applications, etc. on OS X. You do need to disable SIP in OS X 10.11.

**dock** [cDock 2](http://w0lfschild.github.io/app_cDock) 
