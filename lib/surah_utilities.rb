module Surah_utilities

  class Surah_mod

    def self.getNameSurah
      tab = Surah.order("surahId").group(:name).count(:all)
      retour = []
      tab.each do |key, value|
        retour << key
      end

      retour


    end


    #Retourne les versets en fonctions de la sourate donnée en paramètre
    def self.getAyahs(surah_id)
      tab = Surah.where(:surahId => surah_id)
      retour = []

      tab.each do |ayah|
        retour << ayah
      end
      retour

    end
  end

end
