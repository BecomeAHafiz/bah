class SurahsController < ApplicationController
  before_filter :authenticate_user!

  # GET /surahs
  # GET /surahs.json
  def index
    @surahs = Surah.order("position asc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @surahs }
    end
  end

  # GET /surahs/1
  # GET /surahs/1.json
  def show
    @surah = Surah.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @surah }
    end
  end

  # GET /surahs/new
  # GET /surahs/new.json
  def new
    @surah = Surah.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @surah }
    end
  end

  # GET /surahs/1/edit
  def edit
    @surah = Surah.find(params[:id])
  end

  # POST /surahs
  # POST /surahs.json
  def create
    @surah = Surah.new(params[:surah])

    respond_to do |format|
      if @surah.save
        @surah.save_ayah
        format.html { redirect_to @surah, notice: 'Surah was successfully created.' }
        format.json { render json: @surah, status: :created, location: @surah }
      else
        format.html { render action: "new" }
        format.json { render json: @surah.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /surahs/1
  # PUT /surahs/1.json
  def update
    @surah = Surah.find(params[:id])

    respond_to do |format|
      if @surah.update_attributes(params[:surah])
        format.html { redirect_to @surah, notice: 'Surah was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @surah.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surahs/1
  # DELETE /surahs/1.json
  def destroy
    @surah = Surah.find(params[:id])
    @surah.destroy

    respond_to do |format|
      format.html { redirect_to surahs_url }
      format.json { head :no_content }
    end
  end
end
