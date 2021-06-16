module JobHelper
  def choose_photo(job)
    if job.photo.attached?
      cl_image_path(job.photo.key)
    else
      asset_path('random.jpg')
    end
  end
end
