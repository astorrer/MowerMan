class Part < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 45 }, uniqueness: true
end
