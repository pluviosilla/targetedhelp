class User < ActiveRecord::Base
  #attr_accessible :username, :email, :password
  acts_as_authentic
  named_scope :name_like, lambda { |name| { 
            :conditions => ['username LIKE ? OR firstname LIKE ? or lastname LIKE ?',
                            "%#{name}%","%#{name}%","%#{name}%"]}}
  
  #used for recommendations the user has made
  has_many :recommendations_made, :class_name => "Recommendation", :foreign_key => "recommendor_id"

  #used for recommendations made on the user.
  has_many :recommendations, :as => :recommended
  has_many :recommendors, :through => :recommendations
  
  #recipients user has created
  has_many :recipients

  has_attached_file :avatar, :styles => { :tiny => "64x64#",
                                 :small => "115x85#",
                                 :medium => "225x145>"}
  
end
