#!/usr/bin/env ruby
require 'httparty'
require 'multi_json'

class APIError < RuntimeError
end

class FitbitAccount
  include HTTParty
  @@base_uri = 'api.fitbit.com/1/user'

  def initialize()
    @access_token = `echo -n $FB_ACCESS_TOKEN`
    @user_id = `echo -n $FB_USER_ID`
  end

  def error_check
    if @parsed_response["success"] == false
      case @parsed_response.code
      when 401
        if @parsed_response["errors"][0]["errorType"] == "invalid_client"
          puts "Please report this issue on the FitGem (juniorRubyist/fitgem) issue tracker on Github."
        end
      when 403
        if @parsed_response["errors"][0]["insufficient_scope"] == "invalid_client"
          puts "Please report this issue on the FitGem (juniorRubyist/fitgem) issue tracker on Github."
        else
          puts "You may need to modify your privacy settings. Then, try again."
        end
      when 404
        puts "Please report this issue on the FitGem (juniorRubyist/fitgem) issue tracker on Github."
      when 500...600
        puts "Oh no, there might be a Fitbit service outage! Try again soon."
        exit
      else
        puts "Please report this issue on the FitGem (juniorRubyist/fitgem) issue tracker on Github."
      end
      raise APIError, @parsed_response
    end
  end

  def steps
    @response = self.class.get("https://#{@@base_uri}/#{@user_id}/activities/steps/date/today/1d/1min.json",
      :headers => {"Authorization" => "Bearer #{@access_token}"})
    @parsed_response = MultiJson.load(@response.body)
    self.error_check
    @parsed_response = @parsed_response["activities-steps"][0]["value"].to_i
  end

  def floors
    @response = self.class.get("https://#{@@base_uri}/#{@user_id}/activities/floors/date/today/1d/1min.json",
      :headers => {"Authorization" => "Bearer #{@access_token}"})
    @parsed_response = MultiJson.load(@response.body)
    self.error_check
    @parsed_response = @parsed_response["activities-floors"][0]["value"].to_i
  end

  def cals_out
    @response = self.class.get("https://#{@@base_uri}/#{@user_id}/activities/calories/date/today/1d/1min.json",
      :headers => {"Authorization" => "Bearer #{@access_token}"})
    @parsed_response = MultiJson.load(@response.body)
    self.error_check
    @parsed_response = @parsed_response["activities-calories"][0]["value"].to_i
  end

  def distance
    @response = self.class.get("https://#{@@base_uri}/#{@user_id}/activities/distance/date/today/1d/1min.json",
      :headers => {"Authorization" => "Bearer #{@access_token}"})
    @parsed_response = MultiJson.load(@response.body)
    self.error_check
    @parsed_response = @parsed_response["activities-distance"][0]["value"]
  end

  def full_report
    # Full Report
    puts "Full Report:\n-------"
    puts "#{self.steps} steps"
    puts "#{self.distance} miles"
    puts "#{self.floors} stairs climbed"
    puts "#{self.cals_out} calories burned"
  end

  def hello
    return "Hello, World!"
  end

  def help
    puts "NAME"
    puts "    fitgem - A simple Fitbit CLI\n"
    puts "SYNOPSIS"
    puts "    fitgem SHORT-OPTION"
    puts "    fitgem LONG-OPTION\n"
    puts "DESCRIPTION"
    puts "    steps (s) -- Output steps"
    puts "    distance (d) -- Output distance (miles)"
    puts "    floors (f) -- Output climbed floors"
    puts "    calories (c) -- Output calories burned"
    puts "    all (a) -- Output a full report"
    puts "    full -- Same as all or a"
    puts "    help (?) -- Output this help. Same as leaving blank\n"
    puts "BUGS"
    puts "    Please report any bugs to the bug tracker on Github at http://github.com/juniorRubyist/fitgem."
    puts "\nLICENSE"
    puts "    This software is released under the MIT License.\n"
    puts "AUTHOR"
    puts "    Joseph Geis <geis28@gmail.com> (see files AUTHORS for details)."
  end

  def setup
    if @access_token == "" && @user_id == ""
      @configuration = File.new(ENV['HOME']+"/.fitgem", "a+")
      @configuration.puts("")

      print "Copy your Access Token: "
      @access_token = gets.chomp
      @default_shell.puts("export FB_ACCESS_TOKEN=\"#{@access_token}\"")

      print "Copy your User ID: "
      @user_id = gets.chomp
      @default_shell.puts("export FB_USER_ID=\"#{@user_id}\"")

      puts "Alright sparky! Close your terminal or logout and login to get started."
    else
      puts "Hey, you've already finished setup!"
    end
  end
end

fitgem = FitbitAccount.new()
choice = ARGV[0]
unless `echo -n $TRAVIS_CI` == "true"
  case choice
  when 'steps', 's'
    puts "#{fitgem.steps} steps taken"
  when 'distance', 'd'
    puts "#{fitgem.distance} miles walked"
  when 'floors', 'f'
    puts "#{fitgem.floors} floors climbed"
  when 'calories', 'c'
    puts "#{fitgem.calories} calories burned"
  when 'full', 'all', 'a'
    fitgem.full_report
  when 'help', 'h', '?'
    fitgem.help
  else
    puts "Are you lost?, run fitgem help"
  end
end
