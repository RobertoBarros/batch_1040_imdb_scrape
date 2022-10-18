require_relative '../scraper'

describe '#fetch_top_movie_urls' do
  it 'return an array of movies url' do
    urls = fetch_top_movie_urls

    expect = ["https://www.imdb.com/title/tt0111161/",
              "https://www.imdb.com/title/tt0068646/",
              "https://www.imdb.com/title/tt0468569/",
              "https://www.imdb.com/title/tt0071562/",
              "https://www.imdb.com/title/tt0050083/"]

    expect(urls).to eq(expect)
  end
end

describe '#scrape_movie' do
  it 'return Hash describing movie info' do
    the_dark_knight_url = 'https://www.imdb.com/title/tt0468569/'
    info = scrape_movie(the_dark_knight_url)

    expect = {
      title: 'The Dark Knight',
      year: 2008,
      storyline: 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
    }

    expect(info).to eq(expect)
  end
end
