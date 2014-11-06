class User < ActiveRecord::Base  
  belongs_to :department
  has_and_belongs_to_many :work_orders
  has_and_belongs_to_many :misc_work_orders
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :confirmable, :trackable, :validatable, :timeoutable

  acts_as_messageable # Needed for Mailboxer

  scope :department,      -> (number) { where(:department_id => number) }

  def name
    email.rpartition('@').first.titleize
  end

  def mailboxer_email(object)
    email
  end
end
