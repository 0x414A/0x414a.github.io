# What dis?

This is the source code for my [blog](https://allysonjulian.com/).

## Development
### Pre-requisites

[rbenv installation](https://jekyllrb.com/docs/installation/macos/#rbenv):

```shell
xcode-select --install
export SDKROOT=$(xcrun --show-sdk-path)

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install rbenv and ruby-build
brew install rbenv

# Set up rbenv integration with your shell
rbenv init

# Check your installation
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash
```

### Setup

```shell
# ssh
git clone git@github.com:bitjockey42/0x414A.github.io.git

# https
git clone https://github.com/bitjockey42/0x414A.github.io.git

cd 0x414A.github.io

# Install dependencies
bundle install
```

### Running

```shell
bundle exec jekyll serve --livereload
```