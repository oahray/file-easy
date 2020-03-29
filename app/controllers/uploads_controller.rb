class UploadsController < ApplicationController
  before_action :reroute_invalid_session
  before_action :set_upload, only: %i[show edit update destroy]
  before_action :confirm_files_attached, only: %i[create]

  def index
    @uploads = current_user.uploads
  end

  def show; end

  def new
    @upload = current_user.uploads.new
  end

  def edit; end

  def create
    @upload = current_user.uploads.new(upload_params)

    if @upload.created?
      if @upload.files.attached?
        flash[:success] = "Upload successful."
        redirect_to @upload
      end
    else
      render :new
      flash[:error] = @upload.errors.full_messages.to_sentence
    end
  end

  def update
    if @upload.updated?(upload_params)
      redirect_to @upload
      flash[:success] = "Upload was successfully updated."
    else
      redirect_to edit_uploads_path(@upload)
      flash[:warning] = @upload.errors.full_messages.to_sentence
    end
  end

  def destroy
    @upload.destroy
    redirect_to uploads_url
    flash[:success] = "Upload was successfully destroyed."
  end

  private

  def set_upload
    @upload = current_user.uploads.find(params[:id])
  end

  def upload_params
    params.require(:upload).permit(:name, :about, files: [])
  end

  def confirm_files_attached
    unless upload_params[:files].present?
      redirect_to new_upload_path
      flash[:warning] = "No files attached for upload!"
    end
  end
end
