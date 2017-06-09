class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation_email(order)
    @order = order
    subject = "Confirmation of Order #{@order.id}"
    mail(to: @order.email, subject: subject)
  end
end
