class Channel
  include Mongoid::Document
  field :name, type: String
  field :description, type: String, default: ""

  belongs_to :user
end
