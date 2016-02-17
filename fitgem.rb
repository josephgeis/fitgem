#!/usr/bin/env ruby
require 'httparty'
require 'multi_json'

puts "Welcome to FitGem!"
class Fitbit
  include HTTParty
  format :json
  @@base_uri = 'api.fitbit.com/1/user'

  def initialize()
    @access_token = `printf $FB_ACCESS_TOKEN`
    @user_id = `printf $FB_USER_ID`

    unless @access_token != "" && @user_id != ""
      puts "We need some information. It will be saved"
      print "Copy your Access Token: "
      @access_token = gets.chomp

      print "Copy your User ID: "
      @user_id = gets.chomp

      system( "clear" ) # Clears Screen
      # system( "echo \"export FB_ACCESS_TOKEN=#{@acces_token}\" >> ~/.bashrc")
      @authorization_header = {"Authorization" => "Bearer #{@access_token}"}
  end

  def debug_id
    print "BEGIN===\n"
    print @access_token
    puts @user_id
    print "===END"
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

  def cals_out
    @response = self.class.get("https://#{@@base_uri}/#{@user_id}/activities/calories/date/today/1d/1min.json",
      :headers => @authorization_header)
  end

  def distance
    @response = self.class.get("https://#{@@base_uri}/#{@user_id}/activities/distance/date/today/1d/1min.json",
      :headers => @authorization_header)
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

fitbit = Fitbit.new()
exit_var = false
travis_ci = `printf $TRAVIS_CI`
# Main menu
while !exit_var
  # Will Repeat until x is submitted

  if travis_ci == "TRUE"
    `clear`
    puts "Notice: Travis CI detected\n"
    puts "===Full Report==="
    fitbit.full_report
    puts "===Steps==="
    puts fitbit.steps
    puts "===Floors==="
    puts fitbit.floors
    puts "===Distance==="
    puts fitbit.distance
    puts "===Calories==="
    puts fitbit.cals_out
  else
    puts "Choose what to do:\n-------"
    puts "a -- give me full report (steps, calories, floors [if available], and distance)"
    puts "s -- give me steps report"
    puts "d -- give me distance report"
    puts "f -- give me floors report (if availiable)"
    puts "c -- give me calories burned report"
    puts "o -- options"
    puts "x -- exit Fitgem"
    choice = gets.chomp
  end
  system( "clear" )
  case choice
    when "a"
      fitbit.full_report
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
        choice = gets
        choice.to_s.chomp
      end
    else
      puts "Try Again! Not a command"
    end
  end
end
