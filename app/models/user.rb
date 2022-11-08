class User < ApplicationRecord
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :username, length: {minimum: 3}, allow_blank: false
    validates :name, presence: true, uniqueness: { case_sensitive: false }
    validates :identifier, presence: true, on: create
    has_one :job
    has_many :watches

    scope :by_year, ->(year) { joins(:watches).where(watches: { year: year }) }

    before_validation :generate_id
    private
    def generate_id
        self.identifier = "ABC-#{Date.today.year}-#{SecureRandom.hex(3)}"
    end

    #second_callback changing name and username to upper case letters
    before_validation :capitalize_names

    def capitalize_names
        self.name = "#{name.upcase}"
        self.username = "#{username.upcase}"

    end


    #class method
    def userInfo


        name + " " + email
    end
    def userID

        username

    end
    #insrance method
    def self.carName
        puts"BMW M4"
    end

    def self.carNumber
        SecureRandom.random_number(9999)
    end

    def self.carCode
        SecureRandom.base64(16)
    end


end
