class BookSerializer < ActiveModel::Serializer

  attributes(:id, :title, :author, :link, :description, :img2_url, :rating)

  belongs_to :category 
  

end
