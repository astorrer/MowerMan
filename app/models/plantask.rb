class Plantask < ActiveRecord::Base  
  belongs_to :department
  belongs_to :egg_timer
  has_many   :work_orders

  # include PublicActivity::Model

  searchkick # Re-index by running: rake searchkick:reindex CLASS=Plantask 
  # tracked owner: Proc.new{ |controller, model| controller && controller.current_user }

  has_many :records,     :dependent => :destroy
  has_many :work_orders,  :dependent => :destroy 

  scope :assigned,        -> { where(assigned_switch: true) }
  scope :good,            -> { where(current_status: 'GOOD') }
  scope :warning,         -> { where(current_status: 'WARNING') }
  scope :alert,           -> { where(current_status: 'ALERT') }
  scope :pending,         -> { where(assigned_switch: true ) }
  scope :overdue,         -> { where(overdue: true ) }
  scope :equipment,       -> (number) { where(:equip_number => number) }
  scope :associated_user, -> (user) { where(:associate => user.email) }
  scope :department,      -> (number) { where(:department_id => number) }

  validates :area, presence: true
  validates :equipment, presence: true
  validates :part, presence: true
  validates :description, presence: true
  validates :procedure, presence: true
  validates :associate, presence: true
  validates :est_time, presence: true, numericality: { only_integer: true }
  validates :current_status, presence: true

  def update_plantask_status
    # Update the current status of this task to the most recent record
    self.update(:current_status => self.records.last.status)
  end

  def update_plantask_comment
    self.update(:most_recent_comment => self.records.last.comments)
  end

  def unassign_plantask
    # Unassign the planned task
    self.update(:assigned_switch => false)
  end

  #def self.associate_workload
    # Find the average yearly workload of all tasks based upon a 40 hour workweek
    # Note: This is a dangerous hack. Please fix imediently. 
   # avl_time = 480
    #daily = self.daily.sum(:est_time)
#  #  daily = daily * 270
#    weekly = self.weekly.sum(:est_time)
#    weekly = weekly * 54
#    monthly = self.monthly.sum(:est_time)
#    monthly = monthly * 12
#    yearly = self.yearly.sum(:est_time)
#    total = ( daily + weekly + monthly + yearly )
#    total = total / 270
#    workload = ((total.to_f / avl_time.to_f ) * 100 ).round.to_s
#    return workload
#  end

end
