class TopicsController < ApplicationController
  def index
    @forNumNames = ForNumName.all
  end
end
