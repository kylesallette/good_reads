class Review < ApplicationRecord
  validates_presence_of :body, :rating, :user_id
  belongs_to :user


end
