class Pokemon < ActiveRecord::Base
  has_and_belongs_to_many :players
  has_and_belongs_to_many :rivals

end
