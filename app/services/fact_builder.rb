class FactBuilder
  def self.build_facts(api_response)
    api_response.map { |fact_response| build_fact(fact_response) }
  end

  def self.build_fact(api_response)
    Fact.new(
      api_id: api_response['id'],
      category: api_response['category'].try(:first),
      url: api_response['url'],
      value: api_response['value']
    )
  end
end
