#!/usr/bin/env ruby
require 'httparty'
require 'multi_json'

puts "Welcome to FitGem!"
class FitbitAccount
  include HTTParty
  @@base_uri = 'api.fitbit.com/1/user'

  def initialize()
    @access_token = `printf $FB_ACCESS_TOKEN`
    @user_id = `printf $FB_USER_ID`

    if @access_token == "" && @user_id == ""
      puts "We need some information. It will be saved"
      print "Copy your Access Token: "
      @access_token = gets.chomp

      print "Copy your User ID: "
      @user_id = gets.chomp

      system( "clear" ) # Clears Screen
      # system( "echo \"export FB_ACCESS_TOKEN=#{@acces_token}\" >> ~/.bashrc")
      @authorization_header = {"Authorization" => "Bearer #{@access_token}"}
    end
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
    @parsed_response = MultiJson.load(@response.body)
    @parsed_response = @parsed_response["activities-steps"][0]["value"].to_i
  end

  def cals_out
    @response = self.class.get("https://#{@@base_uri}/#{@user_id}/activities/calories/date/today/1d/1min.json",
      :headers => @authorization_header)
    @parsed_response = MultiJson.load(@response.body)
    @parsed_response = @parsed_response["activities-steps"][0]["value"].to_i
  end

  def distance
    @response = self.class.get("https://#{@@base_uri}/#{@user_id}/activities/distance/date/today/1d/1min.json",
      :headers => @authorization_header)
    @parsed_response = MultiJson.load(@response.body)
    @parsed_response = @parsed_response["activities-steps"][0]["value"].to_i
  end

  def full_report
    # Full Report
    puts "Full Report:\n-------"
    puts "#{self.class.steps} steps"
    puts "#{self.class.distance} miles"
    puts "#{self.class.floors} stairs climbed"
    puts "#{self.class.cals_out} calories burned"
  end
end

fitgem = FitbitAccount.new()
exit_var = false
travis_ci = `printf $TRAVIS_CI`
# Main menu
while !exit_var
  if travis_ci == true
    `clear`
    puts "Notice: Travis CI detected\n"
    puts "===Full Report==="
    fitgem.full_report
    puts "===Steps==="
    puts fitgem.steps
    puts "===Floors==="
    puts fitgem.floors
    puts "===Distance==="
    puts fitgem.distance
    puts "===Calories==="
    puts fitgem.cals_out
  else
    puts "Choose what to do:\n-------"
    puts "a -- give me full report (steps, calories, floors [if available], and distance)"
    puts "s -- give me steps report"
    puts "d -- give me distance report"
    puts "f -- give me floors report (if availiable)"
    puts "c -- give me calories burned report"
    puts "o -- options"
    puts "x -- exit Fitgem"
    puts fitgem.steps
    choice = gets.chomp
  end
  system( "clear" )
  case choice
    when "a"
      fitgem.full_report
    when "s"
      # Step Count
      puts "Today's Step Count: #{fitgem.steps}"
    when "d"
      puts "Today's Distance: #{fitgem.distance} mi."
    when "f"
      puts "Floors Climbed: #{fitgem.floors}"
    when "c"
      puts "Calories Burned: #{fitgem.cals_out}"
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
