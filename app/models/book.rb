class Book < ApplicationRecord
    has_many :Images, as: :imageable
    validates :name, presence: true, format: {with: /\A[a-zA-Z]+\Z/, message: "only letters are allowed"}
    validates :price, presence: true , numericality: {message: "must be number" }
end
