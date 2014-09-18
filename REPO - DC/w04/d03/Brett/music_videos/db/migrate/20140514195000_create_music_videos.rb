class CreateMusicVideos < ActiveRecord::Migration
  def change
    create_table :music_videos do |t|
      t.string :title
      t.string :artist
      t.integer :year
      t.text :video_url
    end
  end
end
