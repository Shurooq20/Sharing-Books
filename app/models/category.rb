class Category < ApplicationRecord
    has_many(:books, dependent: :destroy)
    belongs_to :user
end
