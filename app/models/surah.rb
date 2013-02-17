class Surah < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :recitators

  def  self.col_list
      Surah.column_names.collect{ |c| "surahs.#{c}"}.join(",")
  end


  #Retourne les sourates
  def self.getNameSurah
    cpt = 1.to_i

    tab = Surah.select("name, surah_id").group("name, surah_id").order("surah_id")
    retour = Hash.new
    tab.each do |surah|
      retour[surah.name] = surah.surah_id
      cpt = cpt + 1
    end
    retour
  end

  #Retourne les versets en fonctions de la sourate donnée en paramètre
  def self.getAyahs(surah_id)
    tab = Surah.where(:surah_id => surah_id)
    retour = []

    tab.each do |ayah|
      retour << ayah
    end
    retour

  end
end
