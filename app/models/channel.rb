class Channel
  include Mongoid::Document
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 1000 }

  embeds_many :courses

  field :name, type: String
  field :description, type: String, default: ""

  belongs_to :user
end
