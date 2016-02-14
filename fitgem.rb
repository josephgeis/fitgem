#!/usr/bin/env ruby
require 'httparty'
require 'multi_json'

class Fitbit
  include HTTParty
  format :json
  @@base_uri = 'api.fitbit.com/1/user'

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
    @authorization_header = {"Authorization" => "Bearer #{@access_token}"}
  end

  def current_token
    @access_token
  end

  def current_uid
    @user_id
  end

  def steps
    @response = self.class.get("https://#{@@base_uri}/#{@user_id}/activities/steps/date/today/1d/1min.json",
      :headers => @authorization_header)
    @parsed_response = MultiJson.load(@response.body)
    @parsed_response = @parsed_response["activities-steps"][0]["value"].to_i
  end

  def floors
    @response = self.class.get("https://#{@@base_uri}/#{@user_id}/activities/floors/date/today/1d/1min.json",
      :headers => @authorization_header)
  end
end

fitbit = Fitbit.new()
exit_var = false

# Main menu
while !exit_var
  # Will Repeat until x is submitted
  puts "Choose what to do:\n-------"
  puts "a -- give me full report (steps, calories, floors [if available], and distance)"
  puts "s -- give me steps report"
  puts "d -- give me distance report"
  puts "f -- give me floors report (if availiable)"
  puts "c -- give me calories burned report"
  puts "o -- options"
  puts "x -- exit Fitgem"
  choice = gets.chomp
  system( "clear" )
  case choice
    when "a"
      # Full Report
      puts "Full Report:\n-------"
      puts "#{fitbit.steps} steps"
      puts "#{fitbit.distance} miles"
      puts "#{fitbit.floors} stairs climbed"
      puts "#{fitbit.cals_out} calories burned"
    when "s"
      # Step Count
      puts "Today's Step Count: #{fitbit.steps}"
    when "d"
      puts "Today's Distance: #{fitbit.distance} mi."
    when "f"
      puts "Floors Climbed: #{fitbit.floors}"
    when "c"
      puts "Calories Burned: #{fitbit.cals_out}"
    when "o"
      opt_exit = !false
      while opt_exit
        puts "Change Options:\n-------"
        puts "a -- give me full report (steps, calories, floors [if available], and distance)"
        puts "s -- give me steps report"
        puts "d -- give me distance report"
        puts "f -- give me floors report (if availiable)"
        puts "c -- give me calories burned report"
        puts "o -- options"
        puts "x -- exit Fitgem"
        choice = gets.chomp
      end
    else
      puts "Try Again! Not a command"
    end
end
