class Challenge < ApplicationRecord
    has_many :challengers, dependent: :destroy
    has_many :challenging_users, through: :challengers, source: :user

    has_many :acceptors, dependent: :destroy
    has_many :accepting_users, through: :acceptors, source: :user
end


