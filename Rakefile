require_relative './config/environment'

def reload!
  load_all './lib'
end

task :console do
  Pry.start
end

task :scrape_rooms do
  # instantiate a scraper, and then have it find new rooms
  florida_scraper = RoomScraper.new('https://miami.craigslist.org/search/brw/roo?')
  florida_scraper.call
  nyc_scraper = RoomScraper.new('https://newyork.craigslist.org/search/roo')
  nyc_scraper.call
  chicago_scraper = RoomScraper.new('https://chicago.craigslist.org/search/roo')
  chicago_scraper.call
  # after this method call, I should be ablet to say Room.all and have rooms there.
end
