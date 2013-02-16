module Surah_utilities

  class Surah_mod


    # Retourne les sourates.
    def self.getNameSurah
      cpt = 1.to_i

      tab = Surah.order("surahId").group(:name).count(:all)
      retour = Hash.new
      tab.each do |nom_surah, value |
        retour[nom_surah] = cpt
        cpt = cpt + 1
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
