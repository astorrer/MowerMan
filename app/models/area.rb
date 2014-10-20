class Area < ActiveRecord::Base
  validates :area, presence: true, length: { maximum: 45 }
  validates :number, presence: true, numericality: { only_integer: true }, length: { maximum: 5 }
end
