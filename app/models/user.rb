class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :courses, dependent: :destroy
  has_many :lectures, through: :courses
  has_many :student_artworks, through: :lectures, source: :artworks
  has_many :participations
  # has_many :courses, thorough: :participations    ---- CONNECTED TO METHOD THAT CONNECTS USERS TO COURSE PARTICIPATION BELOW
  has_many :courses_participated, -> { distinct }, through: :participations, source: :course
  has_many :lectures_participated, -> { distinct }, through: :courses_participated, source: :lecture

  has_many :course_reviews
  has_many :artworks
  has_many :feedbacks, :class_name => "Feedback", :foreign_key => "teacher_id"
  has_many :feedbacks, :class_name => "Feedback", :foreign_key => "student_id"
  has_attachment :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]


  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def students
    courses.collect(&:students).flatten.uniq
  end

  def one_participation?
    participations.count >= 1
  end

  def three_participations?
    participations.count >= 3
  end

  def first_expressionism?
    categories = []
    participations.each do |participation|
      categories << participation.course.category
    end
    categories.include?("Expressionism")
  end

  def first_review?
    course_reviews.count > 0
  end

  def badge_count
    [one_participation?, three_participations?, first_expressionism?, first_review?].count(true)
  end

  # METHOD TO CONNECT USERS TO COURSE PARTICIPATION
  # def courses_participated_in
  #   courses = []
  #   participations.each do |participation|
  #     courses << participation.course
  #   end
  #   return courses
  # end

  def participates_to?(given_course)
    participations.pluck(:course_id).include?(given_course.id)
  end

  def created_a_course?
    courses.count >= 1
  end

  def count_students
    students = 0
    courses.each do |course|
      students += course.participations.count
    end
    students >= 5
  end

  def artist_badges
    [created_a_course?, count_students].count(true)
  end
end
