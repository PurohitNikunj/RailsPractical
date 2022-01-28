class Book < ApplicationRecord
    # has_many :Images, as: :imageable
    has_one_attached :images, :dependent => :destroy

    validates :name, presence: true, format: {with: /\A[a-zA-Z]+\Z/, message: "only letters are allowed"}
    validates :price, presence: true , numericality: {message: "must be number" }
end
