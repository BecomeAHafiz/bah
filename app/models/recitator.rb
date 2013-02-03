class Recitator < ActiveRecord::Base
  has_and_belongs_to_many :surahs


  def getSurahsOrderByPosition()
    tab = Array.new()
    #surahs = Surah.order("position asc")
    surahs = self.surahs.order("position asc")
    surahs.each {  |surah|
      tab << surah.id
    }
    tab
  end
end
