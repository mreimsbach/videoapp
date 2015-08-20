class Video
  include Mongoid::Document
  include Mongo::Voteable
  mount_uploader :file, VideoUploader

  voteable self, :up => +1, :down => -1

  belongs_to :user
  belongs_to :course
  embeds_many :comments
  has_and_belongs_to_many :categories
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :file, presence: true

  field :name, type: String
  field :description, type: String
  field :file, type: String
  index({name: 1})

  def delete_comments_from_user(user)
    comments = self.comments.where(user_id: user._id).each do |comment|
      comment.destroy
    end
  end
end
