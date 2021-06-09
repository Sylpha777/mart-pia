class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = '送信しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '送信に失敗しました。'
      render :new
    end
  end
  
  private

  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :message)
  end
  
end
