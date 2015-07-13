class Avatar < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  mount_uploader :avatar, AvatarUploader
end
