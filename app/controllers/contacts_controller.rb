class ContactsController < ApplicationController
  before_filter :set_var, :only => [:index, :show, :edit, :new, :create]

  # GET /contacts
  # GET /contacts.xml
  def index
    if current_user
      @user = current_user
      @contacts = current_user.contacts.paginate :per_page => 5, :page => params[:page], :order => 'updated_at DESC'
    end
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /contacts/1
  # GET /contacts/1.xml
  def show
    @contact = Contact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /contacts/new
  # GET /contacts/new.xml
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /contacts/1/edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @user = current_user
    @contact = Contact.new(params[:contact])
    @user.contacts << @contact

    respond_to do |format|
      if @contact.save
        flash[:notice] = 'Contact was successfully created.'
        format.html { redirect_to(@contact) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        flash[:notice] = 'Contact was successfully updated.'
        format.html { redirect_to(@contact) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to(contacts_url) }
    end
  end

  private
    def set_var
      if current_user
        @last_updated_contacts = current_user.contacts.sort() { |x,y| y.updated_at <=> x.updated_at }[0..5]
      end
      @location = Geokit::Geocoders::MultiGeocoder.geocode(request.remote_ip)
    end
end
