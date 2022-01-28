# import date library
require 'date'
class Author < ApplicationRecord
    has_many :books, dependent: :destroy
    # has_many :Images, as: :imageable
    has_one_attached :image, :dependent => :destroy

    validates :first_name, presence: true, format: {with: /\A[a-zA-Z]+\Z/, message: "only letters"}
    validates :last_name, presence: true, format: {with: /\A[a-zA-Z]+\z/} 
    validates :dob, presence: true
    validates :email, presence: true, format: {with: /\A(\S+)@(.+)\.(\S+)\z/, message: "enter valid email"} 

end
