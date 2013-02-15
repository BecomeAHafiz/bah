module SurahsHelper
  def getAllSurahByName()
    hashmap = self.order("surahId").group(:name).count(:all)
    tab = []
    hashmap.each do |nom, nbVersets|
      tab << nom
    end
  end
end
