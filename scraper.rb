
class Scraper
  attr_accessor :response

  def yield_links(block)
    parse_structure.map do |link|
      block.call(link)
    end
  end

  def get_links(&block)
    response = RestClient.get(construct_url)
    self.response = JSON.parse(response)
    yield_links(block)
  end

end
