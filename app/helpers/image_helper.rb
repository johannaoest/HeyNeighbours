module ImageHelper
  def choose_image(job)
    if job.photo.attached?
      cl_image_path job.photo.key
    else
      asset_path 'job_photo.jpg'
    end
  end
end
