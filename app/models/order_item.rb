class OrderItem < ApplicationRecord
  enum manufacture_status: {imposible_to_manufacture: 0, waiting_for_manufacture: 1, manufacturing: 2, manufactured: 3}
  belongs_to :item
  belongs_to :order
end
