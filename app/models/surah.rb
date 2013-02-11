class Surah < ActiveRecord::Base
  has_and_belongs_to_many :recitators
  has_and_belongs_to_many :users

  has_many :ayahs

  validates :name, :position, :nbAyahs, :presence => true
  validates :position, :nbAyahs, :numericality => {:only_integer => true}

  def nbAyahsTotal
    Surah.sum(:nbAyahs)
  end

  def save_ayah
    for i in 1..self.nbAyahs do
      ayah = Ayah.new :position => i
      ayah.surah = self
      ayah.save!
    end
  end

end
