class TopicsController < ApplicationController
  def index
    @for_num_names = ForNumName.all
  end
end
