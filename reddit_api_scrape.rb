#!/usr/bin/ruby

require 'rest-client'
require 'json'
require 'nokogiri'
require 'open-uri'
require 'twitter'
require 'uri'
require 'clipboard'

#source ~/.keys/twitter-api-key
puts ENV['CONSUMER_SECRET']
config = {
    :consumer_key    => ENV['CONSUMER_KEY'],
    :consumer_secret => ENV['CONSUMER_SECRET'],
}

client = Twitter::REST::Client.new(config)
authorised = client.user("zackn9ne")
puts authorised
puts "press 1 for sanity check CR to skip"
sanity = gets.chomp
if sanity == "1"
elsif
puts "continuning..."
end
client.search("to:justinbieber marry me", :result_type => "recent").take(3).each do |tweet|
    puts tweet.user.screen_name
    puts tweet.text
end
puts "Have you listened to the recent ruby rogues podcast"
puts "Valid options /g/c/<cr>"
listen = gets.chomp
if listen == "g"
elsif

puts "continuning..."
end
client.search("from:rubyrogues episode").each do |tweetr|
    puts tweetr.text
    parsed = URI.extract(tweetr.text, ['http', 'https'])
    puts parsed.class
    puts parsed.first
    Clipboard.copy parsed.first
    #then maybe curl the link to ~/downloads
end
# needs more auth
# client.update("I'm meeting with @gem")

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
