class Channel
  include Mongoid::Document
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 1000 }

  embeds_many :courses

  field :name, type: String
  field :description, type: String, default: ""
  has_and_belongs_to_many :subscriber, class_name: "User", inverse_of: :subscriptions

  belongs_to :user

  def following?(user)
    subscriber.include?(user)
  end
end
