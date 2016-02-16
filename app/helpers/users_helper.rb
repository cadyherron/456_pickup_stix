module UsersHelper

  def find_artists_from_bookmarks(bookmarks)
    bookmarks.where("bookmarkable_type = 'Artist'")
  end

  def find_playlists_from_bookmarks(bookmarks)
    bookmarks.where("bookmarkable_type = 'Playlist'")
  end

  def find_songs_from_bookmarks(bookmarks)
    bookmarks.where("bookmarkable_type = 'Song'")
  end

end
