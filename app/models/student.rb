class Student < ApplicationRecord
    validates :first_name, :last_name, :birthdate, :department, presence: true
    validates :first_name, :last_name, format: {with: /\A[a-zA-Z]+\Z/, message: "only letters are allowed"}
    validates :department, inclusion: { in: %w(CE IT),
        message: "can't be %{value}" }
    validates :agree, inclusion: [true, message: "You cannot proceed without accepting Terms of Usage"] 
    
    validates_each :birthdate do |record, attr, value|
        record.errors.add attr, "is not a valid date. You must be at
    least 6 years old to be a student." if value > Date.new((Date.today.year -
    6),(Date.today.month),(Date.today.day))
    end
end
