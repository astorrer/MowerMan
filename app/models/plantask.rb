class Plantask < ActiveRecord::Base  
  belongs_to :department
  belongs_to :egg_timer
  has_many :work_orders

  # include PublicActivity::Model

  searchkick # Re-index by running: rake searchkick:reindex CLASS=Plantask 
  # tracked owner: Proc.new{ |controller, model| controller && controller.current_user }

  has_many :records,     :dependent => :destroy
  has_many :work_orders,  :dependent => :destroy 

  scope :assigned,        -> { where(assigned_switch: true) }
  scope :daily,           -> { where(date: 'DAILY') }
  scope :weekly,          -> { where(date: 'WEEKLY') }
  scope :monthly,         -> { where(date: 'MONTHLY') }
  scope :yearly,          -> { where(date: 'YEARLY') }
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
  validates :method, presence: true
  validates :date, presence: true
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

  def self.associate_workload
    # Find the average yearly workload of all tasks based upon a 40 hour workweek
    # Note: This is a dangerous hack. Please fix imediently. 
    avl_time = 480
    daily = self.daily.sum(:est_time)
    daily = daily * 270
    weekly = self.weekly.sum(:est_time)
    weekly = weekly * 54
    monthly = self.monthly.sum(:est_time)
    monthly = monthly * 12
    yearly = self.yearly.sum(:est_time)
    total = ( daily + weekly + monthly + yearly )
    total = total / 270
    workload = ((total.to_f / avl_time.to_f ) * 100 ).round.to_s
    return workload
  end

  def self.assign_daily_workload
    current_time = Time.now

    self.daily.each do |task|
      if task.records.blank?
        # no records
      else
        last_updated = TimeDifference.between(task.records.last.updated_at, current_time).in_minutes
        if last_updated > 720
          task.assigned_switch = true
          task.overdue = true if last_updated > 2160
        else
          task.overdue = false
          task.overdue_count = 0
          task.assigned_switch = false
        end
      end
      task.save
    end
  end

  def self.daily_overdue_count
    self.daily.each do |task| 
      task.overdue_count += 1 if task.overdue.true?
    end
    task.save
  end

  def self.assign_weekly_workload
    current_time = Time.now
    
    self.weekly.each do |task|
      if task.records.blank?
        # no records
      else
        last_updated = TimeDifference.between(task.records.last.updated_at, current_time).in_minutes
        if last_updated > 10080
          task.assigned_switch = true
          task.overdue = true if last_updated > 20160
          task.overdue_count += 1 if task.overdue.true?
        else
          task.overdue = false
          task.overdue_count = 0
          task.assigned_switch = false
        end
      end
      task.save
    end
  end

  def self.assign_monthly_workload
    current_time = Time.now

    self.monthly.each do |task|
      if task.records.blank?
        # no records
      else
        last_updated = TimeDifference.between(task.records.last.updated_at, current_time).in_minutes
        if last_updated > 43829
          task.assigned_switch = true
          task.overdue = true if last_updated > 53909
          task.overdue_count += 1 if task.overdue.true?
        else
          task.overdue = false
          task.overdue_count = 0
          task.assigned_switch = false
        end
      end
      task.save
    end
  end

  def self.assign_yearly_workload
    current_time = Time.now
    
    self.yearly.each do |task|
      if task.records.blank?
        # no records
      else
        last_updated = TimeDifference.between(task.records.last.updated_at, current_time).in_minutes
        if last_updated > 720
          task.assigned_switch = true
          task.overdue = true if last_updated > 1440
          task.overdue_count += 1 if task.overdue.true?
        else
          task.overdue = false
          task.overdue_count = 0
          task.assigned_switch = false
        end
      end
      task.save
    end
  end

  def upper_lower_bound
    if (self.ext_lower || self.ext_upper).nil?
      return nil
    else
      return self.ext_lower.to_s + ',' + self.ext_upper.to_s
    end
  end

  def upper_bound
    if (self.ext_lower || self.ext_upper).nil?
      return nil
    else
      return self.ext_upper.to_s
    end
  end

  def lower_bound
    if (self.ext_lower || self.ext_upper).nil?
      return nil
    else
      return self.ext_lower.to_s
    end
  end
end
