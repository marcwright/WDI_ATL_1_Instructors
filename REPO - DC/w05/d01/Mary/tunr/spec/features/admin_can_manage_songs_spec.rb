require 'spec_helper'

describe 'Admin can manage songs' do


  it "can create a new song for an artist" do
    beyonce = Artist.create(name: "Beyonce", genre: "Hip-hop", photo_url: "http://www.eonline.com/eol_images/Entire_Site/2013719/rs_600x600-130819130517-600.BeyonceBob.mh.081913.jpg")
    visit new_artist_song_path(beyonce)
    fill_in 'song_title', with: 'Crazy in Love'
    fill_in 'song_year', with: '2003'
    click_button('submit')
    expect( page ).to have_content 'Crazy in Love'
  end

  it "can update a song" do
    beyonce = Artist.create(name: "Beyonce", genre: "Hip-hop", photo_url: "http://www.eonline.com/eol_images/Entire_Site/2013719/rs_600x600-130819130517-600.BeyonceBob.mh.081913.jpg")
    beyonce_song = Song.create(title: "Single Ladies", year: 2008, artist_id: beyonce.id)
    visit edit_artist_song_path(beyonce,beyonce_song)
    fill_in "song_title", with: "Miss Independence"
    click_button("submit")
    expect(page).to have_content "Miss Independence"
  end

  it "can delete a song" do
    beyonce = Artist.create(name: "Beyonce", genre: "Hip-hop", photo_url: "http://www.eonline.com/eol_images/Entire_Site/2013719/rs_600x600-130819130517-600.BeyonceBob.mh.081913.jpg")
    beyonce_song = Song.create(title: "Single Ladies", year: 2008, artist_id: beyonce.id)
    visit artist_path(beyonce)
    click_button("Delete Song")
    expect(page).to_not have_content("Single Ladies")
  end

end #--describes "admin can manage users and songs"
