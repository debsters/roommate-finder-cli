class RoomScraper

  def initialize(index_url)
    @doc = Nokogiri::HTML(open(index_url))
  end

  def call
    rows.each do |row_doc|
      room = Room.create_from_hash(scrape_row(row_doc)) #=> Should put the room in my database.
    end
  end

  private
  def rows
    @rows ||= @doc.search("div.content ul.rows li.result-row p.result-info")
  end

  def scrape_row(row)
    # scrape an individual row
    {
      :date_created => row.search("time").attribute("datetime").text,
      :title => row.search("a.result-title.hdrlnk").text,
      :url => row.search("a").attribute("href").text,
      :price => row.search("span.result-price").text,
    }
  end

end



# def scrape_time
# 	@doc.search("p.result-info")
# end

# def scrape_time
# 	@doc.search("p.result-info time")
# end

# [time, time]
# [title, title]
# [url, url]

# [
# 	[time, title, url]
# ]