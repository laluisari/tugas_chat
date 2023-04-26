class User < ApplicationRecord
    before_create :confirmation_token
    has_secure_password

    has_many :message
    has_many :room_user
    has_many :room, through: :room_user 

    validates :email, presence: true, uniqueness: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
    # validates :nama, presence: true, uniqueness: true
    # validates :password,
    #         length: { minimum: 6 },
    #         if: -> { new_record? || !password.nil? }

    def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
    end
    
    private
    def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
    end

end
