class Song < ActiveRecord::Base

  has_many :bookmarks, as: :bookmarkable, dependent: :destroy
  belongs_to :artist
  has_many :playlist_selections, dependent: :destroy
  has_many :playlists, through: :playlist_selections


  validates :name, presence: true
  validates :artist, presence: true


end
