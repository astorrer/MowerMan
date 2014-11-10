class Area < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 45 }
  validates :number, presence: true, numericality: { only_integer: true }, length: { maximum: 5 }, uniqueness: true
end
