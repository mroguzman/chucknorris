class ChuckNorrisAPI
  def self.random
    response = Faraday.get("#{Rails.configuration.chuck_norris_api_url}/random")

    parse_response(response)
  end

  def self.category(category)
    response = Faraday.get("#{Rails.configuration.chuck_norris_api_url}/random", category: category)

    parse_response(response)
  end

  def self.search(query)
    response = Faraday.get("#{Rails.configuration.chuck_norris_api_url}/search", query: query)

    parse_response(response)['result']
  end

  def self.categories
    response = Faraday.get("#{Rails.configuration.chuck_norris_api_url}/categories")

    parse_response(response)
  end

  private

  def self.parse_response(response)
    JSON.parse(response.body)
  end
end
