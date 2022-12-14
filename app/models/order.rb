class Order < ApplicationRecord
  enum payment: {credit_card: 0, transfer: 1}
  enum order_status: {waiting_for_payment: 0, payment_confirmation: 1, producting: 2, shipping_preparation: 3, shipped: 4}
  belongs_to :customer
  has_many :order_items
end
