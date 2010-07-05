class ContributionController < ApplicationController
  def index
  end  
  def add_contribution
    @recipient = Recipient.find(params[:recipient_id])
    @contribution = @recipient.contributions.build(params[:contribution])
    respond_to do |format|
        if @contribution.save
          format.js
          format.html { redirect_to(@recipient)}
          format.xml { render :xml => @contribution}
        end
    end
  end
end
