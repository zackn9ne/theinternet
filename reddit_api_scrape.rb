require 'rest-client'
require 'json'
require 'nokogiri'
require 'open-uri'

require_relative 'lib/welcome'
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

session1 = Welcome.new
session1.greeting


def get_from(url)
  response = JSON.load( RestClient.get url ) 
  puts response.class

  puts response['new'].class # reads as Hash, Array, now you know you have to loop thorough all  the arrays'! damn, you need a loop here... take a deep breath...

  response['new'].each do | hash_in_new | 
    puts "*!*!*!*!*!**!title!*!**!*!*!**!"
    puts hash_in_new['title']
    puts "*!*!*!*!*!**!title!*!**!*!*!**!"
    puts "press 1 to see the content CR to skip"
    show_content = gets.to_i
    p show_content
    if show_content == 1
      puts "article content================"
      puts hash_in_new['image']
      puts hash_in_new['content']['plain']
      puts "end article content================"
    end
  end
end

def get_from2(url)
  response = JSON.load( RestClient.get url ) 
  puts response.class

  puts response['data']['feed'].class # reads as Hash, Array, now you know you have to loop thorough all  the arrays'! damn, you need a loop here... take a deep breath...

  response['data']['feed'].each do | hash_in_feed |
    puts hash_in_feed['content']['title_alt']
  end
end
#sanity checks
#response['new'].each do | sanity_check_level_1 |
#puts sanity_check_level_1['content'].class
#end

#response['new'].each do | sanity_check_level_2 |
#puts sanity_check_level_2['content']['plain'].class
#end

#junk
#['plain']#story = { title: 'something', category: 'food' }
#story
#end
