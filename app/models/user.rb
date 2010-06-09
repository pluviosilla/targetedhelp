class User < ActiveRecord::Base
  #attr_accessible :username, :email, :password
  acts_as_authentic

  #used for recommendations the user has made
  has_many :recommendations_made, :class_name => "Recommendation", :foreign_key => "recommendor_id"

  #used for recommendations made on the user.
  has_many :recommendations, :as => :recommended
  has_many :recommendors, :through => :recommendations

  has_attached_file :avatar, :styles => { :tiny => "64x64#",
                                 :small => "115x85#",
                                 :medium => "225x145>"}
end
