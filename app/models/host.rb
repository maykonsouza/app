class Host < ApplicationRecord
    mount_uploader :avatar, AvatarUploader
end
