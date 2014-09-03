class Lifters
  attr_accessor :lift_from

  def initialize 
    @lift_from = ""
  end

  def greet_lifters
    puts "your in the lifters now man"
  end

  def lift_mashable #MASHABLE API
    response = RestClient.get('http://mashable.com/stories.json')
    responseJson = JSON.load( response ) 
    puts responseJson.class

    puts response['new'].class # reads as Hash, Array, now you know you have to loop thorough all  the arrays'! damn, you need a loop here... take a deep breath...

    puts responseJson['new']
    responseJson['new'].each do | hash_in_new | 
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

    def lift_reddit
        response = RestClient.get('http://www.reddit.com/.json')
        responseJson = JSON.load(response) 
        puts responseJson

        puts responseJson['data']['children'].class # reads as Hash, Array, now you know you have to loop thorough all  the arrays'! damn, you need a loop here... take a deep breath...

        responseJson['data']['children'].each do | each_child |
          puts "*!*!*!*!*!**!title!*!**!*!*!**!"
          puts each_child['data']['title']
          puts "*!*!*!*!*!**!title!*!**!*!*!**!"
          puts "press 1 to see the content link (sigh its reddit)CR to skip"
          show_content = gets.to_i
          p show_content
          if show_content == 1
            puts "thumbnail link================"
            puts each_child['data']['thumbnail'] 
            puts "article link================"
            puts each_child['data']['url'] 
            puts "end expanded content================"
          end
        end
    end

def lift_noko 
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

#nbu
def choose_lifter
  if @lift_from == "1"
    get_from('http://www.reddit.com')

  elsif @lift_from == "2"
    run_digg

  elsif @lift_from == "nx"
    p "nx exparamental mode entering..."
    #nokogiri_mode("http://autoweek.com")

  elsif @lift_from == "n"
    p "noko scraping mode"
    doc = Nokogiri::HTML(open('http://autoweek.com'))
    doc.css('.excerpt').each do | excerpt |
      puts excerpt.content.strip
    end
  end
end
#end class
end
