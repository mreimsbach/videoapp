class Video
  include Mongoid::Document
  mount_uploader :file, VideoUploader

  belongs_to :course
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }

  field :name, type: String
  field :description, type: String
  field :file, type: String
end
