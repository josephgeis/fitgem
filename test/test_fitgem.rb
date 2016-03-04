#!/usr/bin/env ruby
require_relative 'fitgem.rb'

@access_token = `echo -n $FB_ACCESS_TOKEN`
@user_id = `echo -n $FB_USER_ID`

test_fitgem = FitbitAccount.new()
puts "===Full Report==="
test_fitgem.full_report
puts "===Steps==="
puts test_fitgem.steps
puts "===Floors==="
puts test_fitgem.floors
puts "===Distance==="
puts test_fitgem.distance
puts "===Calories==="
puts test_fitgem.cals_out
