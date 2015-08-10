class Course
  include Mongoid::Document
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 1000 }

  embedded_in :channel
  has_many :videos, dependent: :destroy
  field :name, type: String
  field :description, type: String, default: ""
end
