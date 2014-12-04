class Procedure < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 45 }, uniqueness: true
end
