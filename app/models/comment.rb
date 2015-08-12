class Comment
  include Mongoid::Document
  field :text, type: String
  embedded_in :video
  field :user_id, type: BSON::ObjectId
  validates :text, presence: true,  length: { maximum: 1000 }

  def author
    begin
      User.find(self.user_id)
    rescue Mongoid::Errors::DocumentNotFound
      nil
    end
  end

  def author_name
    writer = self.author
    if (writer.nil?)
      "Deleted user"
    else
      writer.username
    end
  end
end
