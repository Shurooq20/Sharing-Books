class ReviewSerializer < ActiveModel::Serializer

    attributes(:id, :body, :book_id, :created_at)
  
    belongs_to :book
    
    belongs_to(:user, key: :reviewer)
  end
  