class Client < ApplicationRecord
  belongs_to :user
  has_one :loan
  
end
