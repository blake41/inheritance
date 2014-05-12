require 'rest-client'
require 'json'
class Reddit
  BASE_URL = 'http://www.reddit.com/r'
  def initialize(subreddit: 'all')
    @subreddit = subreddit
  end

  def get_links
    response = RestClient.get("#{BASE_URL}/#{@subreddit}.json")
    parsed_response = JSON.parse(response)    
    parsed_response["data"]["children"].map do |link|
      yield link
    end
  end
end