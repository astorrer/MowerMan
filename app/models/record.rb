class Record < ActiveRecord::Base
  belongs_to :plantask
  
  # scope :thirty_day -> { where(created_at: (Time.now.midnight - 30.day)..Time.now.midnight) }
  
  validates :status, presence: true
  validates :data, numericality: true
  validates :comments, length: { maximum: 140 }
end
