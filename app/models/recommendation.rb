class Recommendation < ActiveRecord::Base
  belongs_to :recommended, :polymorphic => true
  belongs_to :recommendor, :class_name => "User", :foreign_key => "recommendor_id"
end
