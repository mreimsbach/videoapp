class Comment
  include Mongoid::Document
  field :text, type: String
  embedded_in :video
end
