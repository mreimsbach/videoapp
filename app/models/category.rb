class Category
  include Mongoid::Document
  field :name, type: String
  field :description, type: String

  references_and referenced_in_many :courses
end
