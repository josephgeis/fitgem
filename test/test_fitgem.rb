#!/usr/bin/env ruby
require_relative 'fitgem.rb'

@access_token = `echo -n $FB_ACCESS_TOKEN`
@user_id = `echo -n $FB_USER_ID`

test_fitgem = FitbitAccount.new()
test_fitgem.full_report
