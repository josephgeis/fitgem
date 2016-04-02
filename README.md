# fitgem [![Build Status](https://travis-ci.org/juniorRubyist/fitgem.svg?branch=less_interactive)](https://travis-ci.org/juniorRubyist/fitgem) [![Slack Chat](https://img.shields.io/badge/chat-on%20slack-brightgreen.svg)](#slack-chat) [![Gem](https://img.shields.io/gem/dt/fitgem-app.svg?label=RubyGems downloads)]() [![Gem](https://img.shields.io/gem/v/fitgem-app.svg?label=On RubyGems)](https://rubygems.org/gems/fitgem-app) :octocat:

A Ruby based Fitbit CLI client.

Fitgem is an interactive CLI Fitbit client that can grab your basic activities from Fitbit.com and print them on your console.
![](http://imgur.com/Fi628Nc)

## Contents
* [Dependencies/Requirements](#dependenciesrequirements)
* [Install](#install)
  * [RubyGems Method](#rubygems-method-)
  * [Portable Installation](#portable-installation)
* [Basic Usage](#basic-usage)
* [Slack Chat](#slack-chat)

## Dependencies/Requirements
* `ruby`
* `httparty` and `multi-json` libraries
* Linux/Mac OSX 

## Install
### RubyGems Method (Recommended) [![Gem](https://img.shields.io/gem/v/fitgem-app.svg)](https://rubygems.org/gems/fitgem-app) [![Gem](https://img.shields.io/gem/dt/fitgem-app.svg)](https://rubygems.org/gems/fitgem-app)
![Gem Install Method](http://imgur.com/sI2eoMS) 

1. Install RubyGems (included with Mac)
  1. Clone the RubyGems repository.
    
    ```sh
    $ git clone https://github.com/rubygems/rubygems.git
    ```
  2. `cd` into the repository.
  
    ```sh
    $ cd rubygems
    ```
  3. Run `setup.rb` with root privileges.
  
    ```sh
    # ruby setup.rb
    ```
2. Install the `fitgem-app` gem.
  
  ```sh
  # gem install fitgem-app
  ```
3. Go to https://juniorrubyist.github.io/fitgem/authorize.html and click <kbd>Authorize Fitbit</kbd>.
4. Sign in to Fitbit, then copy your keys to your `.bashrc` or default shell configuration:

  ```sh
  export FB_ACCESS_TOKEN="YOUR_TOKEN_IN_QUOTES"
  export FB_USER_ID="YOUR_USER_ID_IN_QUOTES"
  ```
5. Type `fitgem <command>` in a terminal window.

### Portable Installation
> This method is not recommended for production uses.

1. Clone the fitgem repository.

  ```sh
  git clone https://github.com/juniorRubyist/fitgem.git
  ```
2. `cd` into `fitgem/bin`.

  ```sh
  cd fitgem/bin
  ```
3. Copy fitgem to your Desktop, home folder, etc.

  ```sh
  cp fitgem /your/destination/folder
  ```
4. Follow step 4 above.
5. `chmod` `fitgem` to `775`.
6. Run `./fitgem <command>` from where you installed it.

# Slack Chat
Please sign up for our Slack Chat here.
[![Slack Chat Sign Up](https://img.shields.io/badge/slack chat-sign up-brightgreen.svg)](http://juniorrubyist.github.io/slack)

Access Slack Chat here.
[![Slack Chat](https://img.shields.io/badge/slack chat-online-brightgreen.svg)](http://juniorrubyist.slack.com)

**<>** with <3 in California