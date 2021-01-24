class Book < ApplicationRecord
    belongs_to :author
    has_many :loans


    validates :author_id, :name, :url_image,:edition, :theme, :issue, :kind , presence: true 
end
