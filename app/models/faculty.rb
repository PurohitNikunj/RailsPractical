class Faculty < ApplicationRecord
    validates :first_name, :last_name, :birthdate, :phoneno, :emailid, :designation, presence: true
    validates :first_name, :last_name, format: {with: /\A[a-zA-Z]+\Z/, message: "only letters are allowed"}
    validates :designation, inclusion: { in: %w(Ass.-Prof Prof),
        message: "must be Ass.-Prof or Prof" }
    validates :emailid, format: {with: /\A(\S+)@(.+)\.(\S+)\z/, message: "enter valid email"}, uniqueness: true
    validates :phoneno, numericality: {only_integer: true, message: "must be number"},
        length: {is: 10, message: "must be of ten digits"}, uniqueness: true
    
    validates_each :birthdate do |record, attr, value|
            record.errors.add attr, "is not a valid date. You must be at
        least 25 years old to be a Prof." if value > Date.new((Date.today.year -
        25),(Date.today.month),(Date.today.day))
    end

end
