class User < ApplicationRecord
  has_many :memberships, -> { order('period DESC') }
  has_many :attendances, -> { order('training_id DESC') }
  has_and_belongs_to_many :trainings,
                          :class_name => 'Training',
                          :join_table => 'trainings_board_members',
                          :foreign_key => 'trainings_id',
                          :association_foreign_key => 'board_members_id'
  has_and_belongs_to_many :trainings,
                          :class_name => 'Training',
                          :join_table => 'trainings_teachers',
                          :foreign_key => 'trainings_id',
                          :association_foreign_key => 'teachers_id'
  scope :is_teacher, -> {where('is_teacher = ?', true)}
  scope :is_board_member, -> {where('is_board_member = ?', true)}
  scope :active, -> {where('date_time >= ?', Time.current)}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  def full_name
    self.first_name + " " + self.last_name
  end

  def get_gender_icon
    (['male', 'female'].include?self.gender) ? self.gender : 'heart'
  end

  def get_user_type_icon
    self.is_board_member == true ? 'users' : 'user'
  end

  def get_memberships
    self.memberships.order(period: :desc)
  end

  def first_membership
    self.first_membership.nil? ? nil : self.first_membership.period
  end

  def current_membership
    current_period = (Date.today.year - ( Date.today.month < 9 ? 0 : 1)).to_s
    self.memberships.find_by(period:current_period)
  end

  def has_membership?
    self.memberships.count > 0
  end

  def get_attendances
    self.attendances.order(training_id: :desc)
  end

  def teacher?
    self.is_teacher == true
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.to_h.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end
    return user
  end

  def last_membership
    return nil unless self.memberships.count > 0
    self.memberships.order('period desc').first
  end

  def first_membership
    return nil unless self.memberships.count > 0
    self.memberships.order('period desc').last
  end

  private

end
