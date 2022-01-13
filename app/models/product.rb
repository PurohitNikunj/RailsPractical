class Product < ApplicationRecord
    validates :product_name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters" }
    validates :price, presence: true , numericality: { only_integer: true, message: "price must be number" }
    validates :qty, presence: true , numericality: { only_integer: true, message: "price must be number" }
end


