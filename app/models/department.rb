class Department < ActiveRecord::Base
  has_many :users
  has_many :plantasks  
end
