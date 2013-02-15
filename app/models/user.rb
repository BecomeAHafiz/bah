class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_and_belongs_to_many :surahs
  has_and_belongs_to_many :ayahs



  #Pour une sourate donnée en paramètre, retourne les versets que l'user connait
  def getAyahsFromSurahForUserAyahId(surah_id)
    tab = []
    retour = []
    tab = self.surahs.where(:surahId => surah_id)
    tab.each do |surah|
      retour << surah.ayahId
    end
    retour
  end
end
