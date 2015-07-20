class ContactsController < ApplicationController

  def index
    @contacts = current_user.contacts
  end


  def show
    @contact = Contact.find(params[:id])
    @message = Message.new
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = current_user.contacts.new(contact_params)
    if @contact.save
      redirect_to user_contacts_path(current_user), notice: 'Successfully added contact'
    else
      render :new, alert: 'Issue adding contact'
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :phone)
  end

end
