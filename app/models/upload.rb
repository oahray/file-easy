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

  def sanitize_list; end

  def detach_files
    files.purge
  end
end
