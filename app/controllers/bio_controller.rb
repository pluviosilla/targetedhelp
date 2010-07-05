class BioController < ApplicationController
  def index
  end
  def edit
    
  end
  def update
    @bio = Bio.find(params[:id])
    respond_to do |format|
      if @bio.update_attributes(params[:bio])
        format.html { redirect_to(Recipient.find(@bio.recipient_id)) }
        format.xml  { render :xml => @bio }
      else
        format.html { redirect_to(recipient_edit_path(Recipient.find(@bio.recipient_id)))}
        format.xml  { render :xml => @bio.errors, :status => :unprocessable_entity }
      end
    end
  end
  def add_field
    @bio = Bio.find(params[:bio_id])
    params[:bio_field][:content] = format_to_html(params[:bio_field][:content]); 
    @bio_field = @bio.bio_fields.build(params[:bio_field])
    respond_to do |format|
        if @bio_field.save
          format.js
          format.html { redirect_to(Recipient.find(@bio.recipient_id))}
          format.xml { render :xml => @bio}
        end
    end
  end
end
