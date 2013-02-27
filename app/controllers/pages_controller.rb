class PagesController < ApplicationController
  def home

    @surah_select = choiceSurah
    @ayahs = Surah.getAyahs  @surah_select
    @sourates = Surah.getNameSurah

  end

  # Récupère tous les noms des dossiers dans le dossier recitators. Autrement dit, récupère tous les récitateurs
  def getAllRecitators
    fichiers = Array.new
    Dir.foreach("app/recitators/") do |dossier|
      if dossier != "." && dossier != ".."
            fichiers <<  dossier
      end
    end
    fichiers
  end

  # Récupère le paramètre du récitateur si il existe
  def choiceRecitator
    # Récupération des paramètres
    recitator = nil
    if params[:page].present?
      if params[:page][:recitator].present?
        recitator = params[:page][:recitator]
      end
    else
      recitator = Recitator.first.id
    end
    recitator
  end

  # Récupère le paramètre de la sourate si il existe
  def choiceSurah
    surah = 1
    if params[:page].present?
      if params[:page][:surah].present?
        surah = params[:page][:surah]
      end
    else
      # Dans le cas où on a dit que l'on connaissant une sourate #
      if params[:surah_id].present?
        surah =   params[:surah_id]
      end
    end
    surah
  end

  # Parse le xml et renvoi le resultat en arabe
  def loadSurah(numberOfSurah)
    #Traitement XML
    f = File.open("app/surahs/#{numberOfSurah}.xml")
    doc = Nokogiri::XML(f)
    f.close
    doc = doc.xpath('//content[@lang = "ar"]')
  end

end
