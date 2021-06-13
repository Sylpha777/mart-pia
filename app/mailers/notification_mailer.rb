class NotificationMailer < ApplicationMailer
  
  def send_signup_to_customer(customer)
    @customer = customer
    mail to: customer.email, subject: 'Mart-Piaへの会員登録が完了しました。'
  end
  
  def send_update_to_customer(customer)
    @customer = customer
    mail to: customer.email, subject: 'Mart-Piaでの会員情報が変更されました。'
  end
  
  def send_complete_to_customer(customer, cart)
    @customer = customer
    @cart = cart
    mail to: customer.email, subject: 'Mart-Piaでの注文が完了しました。'
  end
  
  def send_contact_to_sender(contact)
    @contact = contact
    mail to: contact.email, subject: 'Mart-Piaでのお問い合わせが完了しました。'
  end
  
end
