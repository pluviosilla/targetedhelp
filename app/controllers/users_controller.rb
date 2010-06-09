class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def show
    if params[:id] == "current"
      @user = current_user
    else
      @user = User.find(params[:id].to_s)
    end
    
  end
  def recommend
    user_id = params[:user_id].to_s
    @user = User.find(user_id)
    params[:recommendation][:recommendor_id] = current_user.id
    @recommendation = @user.recommendations.build(params[:recommendation])

    respond_to do |format|
      if @recommendation.save
        #render :partial => 'recommendation', :locals => {:recommendation => recommendation}
        format.js
        format.html{redirect_to :id => nil}
      end
    end
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registration sucessful."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile."
      redirect_to edit_user_path(@user)
    else
      render :action => 'edit'
    end
  end
end
