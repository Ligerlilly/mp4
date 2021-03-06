class Video < ActiveRecord::Base
  has_attached_file :file
  validates_attachment_content_type :file, content_type: ["video/mp4", "application/mp4"]
  validates :title, presence: true
end
