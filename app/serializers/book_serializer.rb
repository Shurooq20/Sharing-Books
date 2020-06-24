class BookSerializer < ActiveModel::Serializer

  attributes(:id, :title, :author, :link, :description, :img2_url, :rating, :created_at)

  belongs_to :category

  belongs_to(:user, key: :owner)
  

end
