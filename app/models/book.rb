class Book < ApplicationRecord
    belongs_to :category
    belongs_to :user

    validates :rating, presence: true, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
    validates :description, presence: true, length: { minimum: 20 }
    validates :title, presence: true, length: { minimum: 5 }
    validates :author, presence: true, length: { minimum: 3 }
    validates :img2_url, format: URI::regexp(%w[http https])
    validates :link, format: URI::regexp(%w[http https])


end
