class WorkOrder < ActiveRecord::Base
  belongs_to :department
  belongs_to :plantask
  has_and_belongs_to_many :users

  scope :complete,        -> { where(completion_switch: true) }
  scope :incomplete,      -> { where(completion_switch: false) }
end
