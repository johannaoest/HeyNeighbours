module AvatarHelper
  def choose_avatar(user)
    if user.avatar.attached?
      cl_image_path(user.avatar.key)
    else
      asset_path('profile.png')
    end
  end
end
