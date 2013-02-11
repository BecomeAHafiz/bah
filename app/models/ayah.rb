class Ayah < ActiveRecord::Base
  belongs_to :surah
  has_and_belongs_to_many :users

end
