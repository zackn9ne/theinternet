class Welcome
  attr_accessor :select_blog
  def initialize
    @select_blog = ""
  end

  def greeting
    p "welcome what blog would u like to ready? /n"
    p "press 1 for mashable, 2 for digg headers or n for nokogiri scraper nx for nokogiri exparamantal"
    @select_blog = gets.strip
  end

  def run_mashable 
    p "loading mashable..." 
    get_from( "mashable.com/stories.json" )
  end

  def run_digg
    p "loading digg headlines"
    get_from2( @select_blog )
  end

  def nokogiri_mode(url)
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


  if @select_blog == "1"
  run_mashable

  elsif @select_blog == "2"
  run_digg

  elsif @select_blog == "nx"
    p "nx exparamental mode entering..."
    nokogiri_mode("http://autoweek.com")


  elsif @select_blog == "n"
    p "noko scraping mode"
    doc = Nokogiri::HTML(open('http://autoweek.com'))
    doc.css('.excerpt').each do | excerpt |
      puts excerpt.content.strip
    end
  end
end
