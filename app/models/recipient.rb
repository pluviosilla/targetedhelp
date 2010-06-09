class Recipient < ActiveRecord::Base
  has_many :recommendations, :as => :recommended
  has_many :recommendors, :through => :recommendations
  
  has_one :bio

  has_attached_file :avatar, :styles => {
                             :tiny => "64x64#",
                             :small => "115x85#",
                             :medium => "225x145>"}

  acts_as_polymorphic_paperclip
end
