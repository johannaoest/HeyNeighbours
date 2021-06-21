module ImageHelper
  def choose_image(job)
    if job.photo.attached?
      cl_image_path job.photo.key
    else
      asset_path 'job_photo.jpg'
    end
  end

  def choose_image_category(category)
    if category.photo.attached?
      cl_image_path category.photo.key
    else
      asset_path 'profile.png'
    end
  end
end
