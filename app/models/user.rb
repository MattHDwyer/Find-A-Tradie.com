class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :timeout_in => 15.minutes

  belongs_to :role
  has_many :business_profiles
  has_many :contacts

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role = Role.find(3)
  end
end
