class User < ActiveRecord::Base
  has_many :articles

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true

end
