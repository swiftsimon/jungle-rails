class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  after_create :send_confirmation

  def send_confirmation
    ReceiptMailer.receipt_email(self.id).deliver_later
  end

end
