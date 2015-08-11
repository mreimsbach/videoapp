class Video
  include Mongoid::Document
  mount_uploader :file, VideoUploader

  belongs_to :user
  belongs_to :course
  embeds_many :comments, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :file, presence: true

  field :name, type: String
  field :description, type: String
  field :file, type: String

end
