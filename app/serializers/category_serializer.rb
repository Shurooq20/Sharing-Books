class CategorySerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :img_url,
    :created_at,
    :updated_at
  )

  has_many(:books)

  class BookSerializer < ActiveModel::Serializer
    attributes :id, :title, :author, :link, :description, :img2_url, :rating
  end
end


