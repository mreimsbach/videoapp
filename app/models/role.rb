class Role
  include Mongoid::Document
  field :name, type: String
  embedded_in :user

  def self.admin
    find_or_create_by(:name => "admin")
  end
end
