class Comment
  include Mongoid::Document
  field :text, type: String
  embedded_in :video
  field :user_id, type: BSON::ObjectId

  def author
    begin
      user = User.find(self.user_id)
    rescue Mongoid::Errors::InvalidFind
      "Deleted user"
    end
  end
end
