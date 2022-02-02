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

    #  =======> CALL-BACKS <========= #

    attr_accessor :skip_any_callback
    
    after_initialize do |student|
        puts "you have initialized #{student.first_name}"
    end

    after_find do |student|
        puts "you have found #{student.first_name}"
    end

    #  skip_callback :initialize, :after, if: :skip_any_callback

    before_validation :date_validation

    skip_callback :validation, :before, :date_validation, if: :skip_any_callback    

    after_destroy :print_id, if: :odd_id

    
    private
    def date_validation
        if self.birthdate > Date.new((Date.today.year - 6),(Date.today.month),(Date.today.day))
            puts "Your dob is not valid so machine validated itself"
            self.birthdate = Date.new((Date.today.year - 6),(Date.today.month),(Date.today.day))
        end
    end

    def odd_id
        if self.id%2 != 0
            return true
        else
            return false
        end
    end

    def print_id
        puts "record which is deleted has odd value of id"    
    end
end
