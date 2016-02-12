#!/usr/bin/env ruby
require 'httparty'
class Fitbit
  include HTTParty
  base_uri 'api.fitbit.com'

  def initialize()
    # FitGem Welcome
    puts "Welcome to FitGem!"
    puts "To get started, I need some information."

    # Set-Up
    puts "Please go to http://jgeis.github.io/fitgem/authorize.html and click \"Authorize Fitbit\". Push Enter when completed\n"
    gets.chomp
    puts "Ok now, paste the access token here. It is very long. Make sure you get all of it."
    @access_token = gets.chomp
    puts "Great, now paste the user id here."
    @user_id = gets.chomp
    puts "All done! You will need to do this every time I run. Press Enter to continue to main menu."
    gets.chomp
    system( "clear" ) # Clears Screen
  end

  def current_token
    @access_token
  end

  def current_uid
    @user_id
  end

  def steps
    @@response = self.class.get("https://api.fitbit.com/1/user/#{@user_id}/activities/steps/date/today/1d/1min.json",
      :headers => {"Authorization" => "Bearer #{@access_token}"})
    @@response.each do |k, v|
      v["value"]
    end
  end
end

fitbit = Fitbit.new()
exit_var = false
# Main menu
# while !exit_var
  # Will Repeat until x is submitted
#  puts "Main Menu"
#  puts "f -- full (steps, calories, floors [if available], and distance)"
#  puts ""
#  gets.chomp
#end

puts fitbit.steps