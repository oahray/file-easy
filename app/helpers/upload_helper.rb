module UploadHelper
  def discard_file(file)
    file.purge
  end

  def icon_path(file)
    case file.content_type
    when "image/jpeg" then file
    when "image/png" then file
    when "application/pdf" then "pdf-icon.png"
    when "application/doc" then "doc-icon.png"
    when "video/mp4" then "mp4-icon.png"
    else "file-icon.png"
    end
  end
end
