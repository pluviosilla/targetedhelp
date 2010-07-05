class UserHubController < ApplicationController
  def index    
    @search = Recipient.search(params[:search])
    if params[:search]
      @search_results = @search.all
    else
      @search_results = []
    end
  end
end
