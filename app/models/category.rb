class Category
  include Mongoid::Document
  field :tag, type: String
  has_and_belongs_to_many :videos
  validates :tag, presence: true, uniqueness: true, length: { maximum: 20 }

end
