class Bio < ActiveRecord::Base
  belongs_to :recipient
  has_many :bio_fields
end
