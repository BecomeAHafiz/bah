class LinkUsersSurahsController < ApplicationController
  def create
    # Recupération de l'user
    user  = current_user

    #Récupération de la sourate
    surah_id = params[:surah_id]

    #Création de la relation
    if user.surahs << Surah.find(surah_id)
      respond_to do |format|
        format.html { redirect_to :controller=>'pages', :action => 'home', :surah_id => surah_id }
        format.js
      end
    end
  end

  def destroy
    # Recupération de l'user
    user  = current_user

    #Récupération de la sourate
    surah_id = params[:surah_id]

    #Suppression de la relation
    if user.surahs.delete(Surah.find(surah_id))
      respond_to do |format|
        format.html { redirect_to :controller=>'pages', :action => 'home', :surah_id => surah_id }
        format.js
      end
    end
  end
end
