class User < ActiveRecord::Base
  belongs_to :department
  has_and_belongs_to_many :work_orders
  has_and_belongs_to_many :misc_work_orders
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable, :timeoutable

  acts_as_messageable # Needed for Mailboxer

  scope :department, -> (number) { where(:department_id => number) }

  def name
    email.rpartition('@').first.titleize
  end

  def mailboxer_email(object)
    email
  end

  # Modify Devise to Allow Manual Account Activation
  def active_for_authentication?
    # Uncomment the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml
    super && active_account?
  end

  protected
    def assign_active_state
      self.update(:active_account => false)
    end
end
