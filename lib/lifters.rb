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
  grabbed_link = Nokogiri::HTML(open("http://autoweek.com").read).css("a")
    puts grabbed_link

  grabbed_link.each do | link |
    each_link = link['href']
        p each_link
    end

    #test!
    @each_link = "http://autoweek.com/article/indycar/will-power-and-chevy-capture-indycar-pole-sonoma"
    @each_link = "http://autoweek.com/article/car-news/chrysler-nissan-toyota-sell-big-august"
    #test
end

def lift_noko_followed
    header = Nokogiri::HTML(open(@each_link).read).css("h1")
    puts header.to_s
    image = Nokogiri::HTML(open(@each_link)).css(".article-wrap img")
    puts "here is the image"
    image = image.to_s
    puts image.class
    puts image['src']


    #xpath is the way to go... erase the shit above.... ^^^^^!!!!

    doc = Nokogiri::HTML(open(@each_link))
    doc.xpath('//h1').each do |header|
        puts header.text
    end
    doc.xpath('//img').each do |img|
      puts "Header: #{img.xpath('preceding::h2[1]').text}"
        puts "  Image: #{img['src']}"
      end
    doc.xpath('//article').each do |article|
        puts article.text
    end
end
    


#nbu
 #   p "noko scraping mode"
 #   doc = Nokogiri::HTML(open('http://autoweek.com'))
 #   doc.css('.excerpt').each do | excerpt |
 #     puts excerpt.content.strip

#end the class
end
