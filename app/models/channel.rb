class Channel
  include Mongoid::Document
  field :name, type: String
  field :description, type: String, default: ""

  has_one :user
end
