class BookSerializer < ActiveModel::Serializer
  attributes  :author_id, :author, :id, :name, :url_image, :edition, :theme, :issue, :kind,
  belongs_to :author

 def author
  Author.find(self.object.author_id).name
   
 end
 
end
