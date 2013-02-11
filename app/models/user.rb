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

  def surahConnu?(id)
    surah_ids.include? id.to_i
  end



  def percentageSurah
    ("%.2f" % (surahs.sum(:nbAyahs)/6236.to_f * 100))
  end


  # Retourne tous les versets connu par l'utilisateur pour la sourate donné en param. (Retourne la position des versets)

  def getTabOfPosition(surah_id)
    tab = Array.new
    ayahs.where(:surah_id => surah_id).each do |ayah|
      tab << ayah.position
    end
    return tab
  end

end
