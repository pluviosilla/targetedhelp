class Recipient < ActiveRecord::Base
  has_one :bio

  accepts_nested_attributes_for :bio
  
  
  has_many :recommendations, :as => :recommended
  has_many :recommendors, :through => :recommendations
  has_many :contributions


  belongs_to :user
  
  named_scope :name_like, lambda { |name| {
            :conditions => ['firstname LIKE ? or lastname LIKE ?',
                            "%#{name}%","%#{name}%"]}}

  has_attached_file :avatar, :styles => {
                             :tiny => "64x64#",
                             :small => "115x85#",
                             :medium => "225x145>"}

  acts_as_polymorphic_paperclip
  
end
