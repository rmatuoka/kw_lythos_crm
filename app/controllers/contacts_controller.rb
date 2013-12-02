class ContactsController < ApplicationController
  access_control do
      allow :administrator, :all
      allow :supervisor, :all
      allow :seller, :all
  end
  
  def index
    if !params[:filter].blank?
      @contacts = current_user.contacts.all(:conditions => ['name LIKE ?', "#{params[:filter]}%" ])
    elsif !params[:search].blank?
      @contacts = current_user.contacts.all(:conditions => ['name LIKE ? OR email LIKE ?', "%#{params[:search]}%","%#{params[:search]}%" ])
    else
      @contacts = current_user.contacts.all
    end
  end
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      redirect_to contact_path(@contact), :notice => "Successfully created user."
    else
      render :action => 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end
  
  def show
    @contact = Contact.find(params[:id])
  end
  
  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to contact_path(@contact), :notice  => "Successfully updated user."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @contacts = Contact.find(params[:id])
    @contacts.destroy
    redirect_to contacts_path, :notice => "Usuário Deletado com sucesso!"
  end
end
