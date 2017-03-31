class FactsController < ApplicationController
  FACTS_PER_PAGE = 5

  before_action :set_categories

  def random
    @fact = FactBuilder.build_fact(ChuckNorrisAPI.random)
    @fact.save!

    render 'show'
  end

  def category
    @fact = FactBuilder.build_fact(ChuckNorrisAPI.category(params[:category]))
    @fact.save!

    render 'show'
  end

  def search
    @query = params[:query]
    @facts = []

    @facts = FactBuilder.build_facts(ChuckNorrisAPI.search(@query)) if @query.present?
    @facts = Kaminari.paginate_array(@facts).page(params.fetch(:page, 1)).per(FACTS_PER_PAGE)
    @facts.each(&:save!)

    render 'index'
  end

  private

  def set_categories
    @categories = ChuckNorrisAPI.categories
  end
end
