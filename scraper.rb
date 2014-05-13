
class Scraper
  attr_accessor :response

  def yield_links
    parse_structure.map do |link|
      yield link
    end
  end

  def get_links
    response = RestClient.get(construct_url)
    self.response = JSON.parse(response)
  end
  
end
