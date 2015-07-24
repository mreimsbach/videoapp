class Channel
  include Mongoid::Document
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 1000 }

  field :name, type: String
  field :description, type: String, default: ""

  belongs_to :user
end
