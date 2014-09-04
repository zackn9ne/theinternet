class Welcome
  attr_accessor :select_blog

  def initialize
    @select_blog = ""
  end

  def greeting
    p "welcome what blog would u like to read?"
    p "press 1 for mashable, 2 for reddit headers or nokogiri scraper nx for nokogiri exparamantal"
    @select_blog = gets.strip
  end

  def run_mashable 
    p "loading mashable..." 
    runtime = Lifters.new
    runtime.greet_lifters
    runtime.lift_mashable
  end

  def run_reddit 
    p "loading reddit headlines"
    runtime = Lifters.new
    runtime.greet_lifters
    runtime.lift_reddit
  end

  def run_noko
    p "loading nokogiri headlines"
    runtime = Lifters.new
    runtime.greet_lifters
    runtime.lift_noko
    runtime.lift_noko_followed
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

def chooseBlog
  case @select_blog
  when "1"
    puts "running mashable"
    run_mashable
  when "2"
    run_reddit 
  when 'nx'
    p "nx exparamental mode entering..."
    run_noko
  when 'n'
    p "noko scraping mode"
    doc = Nokogiri::HTML(open('http://autoweek.com'))
    doc.css('.excerpt').each do | excerpt |
      puts excerpt.content.strip
  end
  else
    puts "you put in .. #{@select_blog}.. thats not a option"
    puts "please read the directions OK?"
  end
end
end
