class LinkUsersAyahsController < ApplicationController
  def create
    # Recupération de l'user
    user  = current_user

    #Récupération de la sourate
    surah = Surah.find(params[:surah_id])


    #Récupération de la position du verset
    ayah_position = params[:ayah_position]

    #Récupération du ayah
    ayah = surah.ayahs.where(:position => ayah_position)


    #Création de la relation

    if user.ayahs << ayah
      respond_to do |format|
        format.html { redirect_to :controller=>'pages', :action => 'home' }
        format.js
      end
    end
  end

  def destroy
    user  = current_user

    #Récupération de la sourate
    surah = Surah.find(params[:surah_id])


    #Récupération de la position du verset
    ayah_position = params[:ayah_position]

    #Récupération du ayah
    ayah = surah.ayahs.where(:position => ayah_position)

    #Suppression de la relation
    if user.ayahs.delete(ayah)
      respond_to do |format|
        format.html { redirect_to :controller=>'pages', :action => 'home' }
        format.js
      end
    end
  end
end
