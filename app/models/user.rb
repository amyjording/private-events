class User < ApplicationRecord
	attr_accessor :remember_token
  has_many :event_attendings
  has_many :attended_events, through: :event_attendings, source: :attended_event
  has_many :events, foreign_key: "user_id", class_name: "Event", dependent: :destroy
	validates :name, presence: true
	validates :email, presence: true
  accepts_nested_attributes_for :attended_events

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
	def User.new_token
    	SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

   def forget
    update_attribute(:remember_digest, nil)
  end
end
