class LoanSerializer < ActiveModel::Serializer
  attributes :id , :expiry_date, :delay_days, :fine, :book_id, :book, :client_id, :user, :status

 def user
  User.find(self.object.client_id).name
 end
 def book
  Book.find(self.object.client_id).name
 end
end
