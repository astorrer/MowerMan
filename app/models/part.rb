class Part < ActiveRecord::Base
  validates :part, presence: true, length: { maximum: 45 }
end
