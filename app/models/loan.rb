class Loan < ApplicationRecord
  belongs_to :book
  belongs_to :client



  validates :expiry_date, :book_id,  presence: true
  validates :client_id, presence: true,  uniqueness: true

end
