class Artwork < ApplicationRecord
  belongs_to :lecture
  belongs_to :user
  has_attachment :photo
end
