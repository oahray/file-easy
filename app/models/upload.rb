class Upload < ApplicationRecord
  has_many_attached :files
  belongs_to :user

  before_destroy :detach_files
  validates :name, presence: true, length: { minimum: 3 }, uniqueness: { case_sensitive: false }
  before_validation :sanitize_list

  def created?
    with_lock do
      save
    end
  end

  def updated?(params)
    with_lock do
      update(params)
    end
  end

  private

  def sanitize_list
    return if files.size < 2

    file_set = {}

    files.each do |file|
      check = file.blob.checksum

      file.purge if file_set[check].present?

      file_set[check] = file.blob
    end
  end

  def detach_files
    files.purge
  end
end
