class PagesController < ApplicationController
  def home
  	#Declaration de variables
      @recitators = Recitator.order("name asc")
      @surahs = Surah.order("position asc")

  	#_______________________________________________________
      @recitator_selected  = choiceRecitator
      @surah_selected = choiceSurah
      @surah_content = nil
      @surahConnu = nil
      if !@surah_selected.nil?
        @surah_content = loadSurah(Surah.find(@surah_selected).position)
        if user_signed_in?
          @surahConnu = current_user.surahConnu? @surah_selected
        end
      end


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
  end

  # Récupère le paramètre de la sourate si il existe
  def choiceSurah
    surah = nil
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
