class ReviewSerializer < ActiveModel::Serializer

    attributes(:id, :body, :book_id)
  
    belongs_to :book
    
  
  end
  