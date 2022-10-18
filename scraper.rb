require 'open-uri'
require 'nokogiri'

def fetch_top_movie_urls
  top_movies_url = 'https://www.imdb.com/chart/top'
  html_file = URI.open(top_movies_url).read
  html_doc = Nokogiri::HTML(html_file)

  # TODO: return top movies URLs

  movies = []
  html_doc.search('.titleColumn a').first(5).each do |tag|
    movies << "https://www.imdb.com#{tag.attributes['href'].value}"
  end
  movies
end

def scrape_movie(url)
  html_file = URI.open(url, 'Accept-Language' => 'en').read
  html_doc = Nokogiri::HTML(html_file)

  # TODO: return movie info hash
  {
    title: html_doc.search('h1').text,
    year: html_doc.search('.sc-8c396aa2-2').first.text.to_i,
    storyline: html_doc.search('.sc-16ede01-0').text
  }
end
