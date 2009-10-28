class ContactsController < ApplicationController
  before_filter :set_var, :only => [:index, :show, :edit, :new]
  before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.xml
  def index
    @contacts = Contact.paginate :per_page => 5, :page => params[:page], :order => 'updated_at DESC'

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
    @address = Address.new
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
    @contact = Contact.new(params[:contact])

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
      @last_updated_contacts = Contact.all.sort() { |x,y| y.updated_at <=> x.updated_at }[0..5]
      @location = Geokit::Geocoders::MultiGeocoder.geocode('84.10.21.55')#request.remote_ip)
    end
end
