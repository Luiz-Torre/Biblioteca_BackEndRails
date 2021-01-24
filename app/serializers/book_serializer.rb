class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :url_image, :edition, :theme, :issue, :kind, :author_id, :author
  belongs_to :author

 def author
  Author.find(self.object.author_id).name
   
 end
 
end
