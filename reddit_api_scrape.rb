# We're going to add a remote data source to pull in stories from Mashable and Digg.
# http://mashable.com/stories.json
# http://digg.com/api/news/popular.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"
# We're going to add a remote data source to pull in stories from Mashable and Digg.
# http://mashable.com/stories.json
# http://digg.com/api/news/popular.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"
require 'rest-client'
require 'json'
require 'nokogiri'
require 'open-uri'

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
class Menu
def greeting
p "welcome what blog would u like to ready? /n"
p "press 1 for mashable, 2 for digg headers or n for nokogiri scraper nx for nokogiri exparamantal"
@select_blog = gets.strip
end

if select_blog == "1"
  p "loading mashable..." 
  get_from( "mashable.com/stories.json" )

elsif select_blog == "2"
  p "loading digg headlines"
  get_from2( select_blog )

elsif select_blog == "nx"
  p "nx"
  array = []
  array.push "asdf"
  p array

  def get_links(url)
  doc = Nokogiri::HTML(open("http://autoweek.com").read).css("a")

      doc.each do | link |
      each_link = link['href']
      p each_link
      #test!
        each_link = "http://autoweek.com/article/indycar/will-power-and-chevy-capture-indycar-pole-sonoma"
      #test
      parsed_link = Nokogiri::HTML(open(each_link).read).css("article")
      parsed_link do | content |
      p content
      end
      end

  end
  get_links("http://autoweek.com")

elsif select_blog == "n"
    p "noko scraping mode"
    doc = Nokogiri::HTML(open('http://autoweek.com'))
    doc.css('.excerpt').each do | excerpt |
      puts excerpt.content.strip
    end
end
