class ReceiptMailer < ApplicationMailer

  default from: 'noreply@jungle.com'

  def receipt_email(order_id)
    @order = Order.find(order_id)
    mail(to: @order.email, subject: "Confirmation from Jungle order #{@order.id}")
  end

end
