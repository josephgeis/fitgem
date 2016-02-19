# fitgem [![Build Status](https://travis-ci.org/juniorRubyist/fitgem.svg?branch=master)](https://travis-ci.org/juniorRubyist/fitgem) :octocat:
A Ruby based Fitbit CLI client.

Fitgem is an interactive CLI Fitbit client that can grab your basic activities from Fitbit.com and print them on your console.

## Dependencies
* `ruby`
* `httparty` and `multi-json` libraries

## RubyGems Installation [![Gem Version](https://badge.fury.io/rb/fitgem-app.svg)](https://badge.fury.io/rb/fitgem-app)

1. Install RubyGems
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
5. Type `fitgem` in a terminal window.
