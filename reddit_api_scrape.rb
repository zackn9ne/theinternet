#!/usr/bin/ruby

require 'rest-client'
require 'json'
require 'nokogiri'
require 'open-uri'

require_relative 'lib/welcome'
require_relative 'lib/lifters'

# response = RestClient.get('http://www.reddit.com/.json')
# json_response = JSON.load(response)
# data = json_response['data']

def get_input
  gets.strip #chomp was also used..
end

def show_message message
  puts message
end

def calculate_upvotes story
  story[:upvotes] = 1
  if story[:title].downcase.include?('cat')
    story[:upvotes] *= 5
  elsif story[:title].downcase.include?('bacon')
    story[:upvotes] *= 8
  end

  story[:upvotes] *= 3 if story[:category].downcase == "food"
end

session1 = Welcome.new #from /lib/Welcome
session1.greeting
session1.chooseBlog
