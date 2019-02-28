module UploadHelper
  def discard_file(file)
    file.purge
  end

  def icon_path(file)
    case file.content_type
    when "image/jpeg" then file
    when "image/png" then file
    when "application/pdf" then "/assets/pdf-icon.png"
    when "application/doc" then "/assets/doc-icon.png"
    when "video/mp4" then "/assets/mp4-icon.png"
    else "/assets/file-icon.png"
    end
  end
end
