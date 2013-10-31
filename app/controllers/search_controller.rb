class SearchController < ApplicationController
  def index
    keywords = params[:q] || ""
  end
end
