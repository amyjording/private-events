class Event < ApplicationRecord
	has_many :event_attendings
	has_many :attendees, -> { where('invited == ?', true) }, through: :event_attendings, source: :event_attendee
	has_many :invited_guests, -> { where('invited == ?', false) }, through: :event_attendings, source: :event_attendee 
	belongs_to :creator, class_name: "User", foreign_key: "user_id"
	default_scope -> { order(created_at: :desc) }
	validates :creator, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  scope :upcoming_events, -> { where('event_date >= ?', Time.now) }
  scope :previous_events, -> { where('event_date <= ?', Time.now) }
  accepts_nested_attributes_for :event_attendings

end
