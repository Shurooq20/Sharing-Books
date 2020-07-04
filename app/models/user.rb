class User < ApplicationRecord

    has_secure_password
    
    has_many :categories
    has_many :books

    validates(:email, presence: true, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)

    has_many :challengers, dependent: :destroy
    has_many :outgoing_challenges, through: :challengers, source: :challenge
    
    has_many :acceptors, dependent: :destroy
    has_many :incoming_challenges, through: :acceptors, source: :challenge

end
