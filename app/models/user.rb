class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_and_belongs_to_many :surahs

  def surahConnu?(id)
    surah_ids.include? id.to_i
  end

  def percentageSurah
    ("%.2f" % (surahs.sum(:nbAyahs)/6236.to_f * 100) )
  end

end