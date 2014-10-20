class TaskMethod < ActiveRecord::Base
  validates :method, presence: true, length: { maximum: 45 }
end
