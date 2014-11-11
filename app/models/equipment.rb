class Equipment < ActiveRecord::Base
  #has_many :plantasks, :foreign_key => 'equip_number', :primary_key => 'number' # Notice the use of a non-standard primary key. This does not follow convention.
  
  #scope :daily,           -> { where( self.plantasks.date => 'DAILY') }
  #scope :associated_user, -> (user) { where( self.plantasks.associate => user.email) }
  #scope :assigned,        -> { where(self.plantasks.assigned_switch => true) }
  
  # Notice that I have scoped through an associated model here. I don't know if this is a good plan or not.
    
  validates :name, presence: true, length: { maximum: 45 }
  validates :number, presence: true, numericality: { only_integer: true }, length: { maximum: 5 }, uniqueness: true
end
