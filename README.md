# fitgem [![Build Status](https://travis-ci.org/juniorRubyist/fitgem.svg?branch=master)](https://travis-ci.org/juniorRubyist/fitgem) :octocat:
A Ruby based Fitbit CLI client.

Fitgem is an interactive CLI Fitbit client that can grab your basic activities from Fitbit.com and print them on your console.

## Dependencies
* `ruby`
* `httparty` and `multi-json` libraries

## Installation
> #### About Installation
> Currently, we only have a portable version. I am planning on making a Debian package (.deb) version in the near future.
> The commands below are based on Ubuntu/Debian.

1. Install `ruby` from your package manager. `apt-get install ruby`
2. Install `httparty`, `multi-json` gems. `gem install httparty multi-json`
3. Clone the repository. `git clone https://github.com/juniorRubyist/fitgem.git`
4. Run `chmod` on `fitgem.rb`. `chmod 775 fitgem.rb`
5. Run `fitgem.rb`. `./fitgem.rb` or `ruby fitgem.rb`
