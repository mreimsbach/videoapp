class User
  include Mongoid::Document
  has_one :channel, dependent: :destroy
  before_create :adminize
  after_create :init_channel
  validates :username, presence: true, length: { maximum: 50 }
  validates :email, uniqueness: true
  has_many :videos, dependent: :destroy
  has_and_belongs_to_many :subscriptions, class_name: "Channel", inverse_of: :subscriber

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :username,          type: String, default: ""
#  field :last_name,           type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  field :admin, type: Boolean, default: false

  # Confirmable
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  # def send_devise_notification(notification, *args)
  #   devise_mailer.send(notification, self, *args).deliver_later
  # end

  private
    def adminize
      if (self.email == "mreimsbach@avarteq.de" || self.email == "sschmidt@avarteq.de")
        self.admin = true
      end
    end

    def init_channel
      if channel == nil
        channel = Channel.new
        channel.user = self
        channel.name = "#{self.username}'s Awesome Channel"
        channel.save!
      end
    end


end
