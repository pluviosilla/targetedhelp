class TrustChainController < ApplicationController
  def index
  end

  def show
    @user = User.find_by_id(params[:id])
    @recommendations = @user.recommendations
  end

end
