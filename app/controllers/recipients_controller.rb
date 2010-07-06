class RecipientsController < ApplicationController
  # GET /recipients
  # GET /recipients.xml
  def index
    @title_path = "<img src='/images/people-banner.gif'/>"
    
    @sick_recipients = Recipient.all(:conditions => "category_id = 1")
    @poor_recipients = Recipient.all(:conditions => "category_id = 2")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recipients }
    end
  end
  def recommend
    recipient_id = params[:recipient_id].to_s
    @recipient = Recipient.find(recipient_id)
    params[:recommendation][:recommendor_id] = current_user.id
    params[:recommendation][:description] = format_to_html(params[:recommendation][:description])
    @recommendation = @recipient.recommendations.build(params[:recommendation])
    
    respond_to do |format|
      if @recommendation.save
        #render :partial => 'recommendation', :locals => {:recommendation => recommendation}        
        format.js
        format.html{redirect_to :id => nil}
      end
    end
  end
  def show_by_name
    @names = params[:name].split("_")
    @recipient = Recipient.find_by_firstname_and_lastname(@names[0],@names[1])
    @title_path = "<img src='" + @recipient.banner_path + "'/>"
    respond_to do |format|s
      format.html # show.html.erb
      format.xml  { render :xml => @recipient }
    end

  end
  # GET /recipients/1
  # GET /recipients/1.xml
  def show    
    @recipient = Recipient.find(params[:id])
    if @recipient.banner_path.length != 0
      @title_path = "<img src='" + @recipient.banner_path + "'/>"
    else
      @title_path = DEFAULT_BANNER_PATH
    end
    @owner = false;
    if current_user
      if current_user.id == @recipient.id
        @owner = true;
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recipient }
    end
  end

  # GET /recipients/new
  # GET /recipients/new.xml
  def new
    @recipient = Recipient.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recipient }
    end
  end

  # GET /recipients/1/edit
  def edit
    @recipient = Recipient.find(params[:id])
    if current_user && @recipient.user_id != current_user.id
      redirect_to @recipient
    end
  end

  # POST /recipients
  # POST /recipients.xml
  def create
    #@recipient = Recipient.new(params[:recipient])
    @recipient = current_user.recipients.build(params[:recipient])
    @recipient.bio = Bio.new
    
    @recipient.bio.family_economics = ""
    @recipient.bio.contribution_methods = ""

    respond_to do |format|
      if @recipient.save
        flash[:notice] = 'Recipient was successfully created.'
        format.html { redirect_to(@recipient) }
        format.xml  { render :xml => @recipient, :status => :created, :location => @recipient }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recipient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recipients/1
  # PUT /recipients/1.xml
  def update
    @recipient = Recipient.find(params[:id])
    if params[:recipient][:bio]
      bio_params = params[:recipient][:bio]
      bio_params[:contribution_methods] = format_to_html(bio_params[:contribution_methods])
      bio_params[:family_economics] = format_to_html(bio_params[:family_economics])
    end
    #asset = params[:recipient][:data]
    #if asset
      #@recipient.assets.attach(asset)
    #end
    respond_to do |format|
      if @recipient.update_attributes(params[:recipient])
        flash[:notice] = 'Recipient was successfully updated.'
        format.html { redirect_to edit_recipient_path(@recipient) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recipient.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recipients/1
  # DELETE /recipients/1.xml
  def destroy
    @recipient = Recipient.find(params[:id])
    @recipient.destroy

    respond_to do |format|
      format.html { redirect_to(recipients_url) }
      format.xml  { head :ok }
    end
  end
end
