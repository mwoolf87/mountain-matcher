class Review < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :mountain, required: true
end
