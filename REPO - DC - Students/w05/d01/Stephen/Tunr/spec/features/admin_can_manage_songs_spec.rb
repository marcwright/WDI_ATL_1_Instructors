#!/usr/bin/ruby
# @Author: stephenstanwood
# @Date:   2014-05-19 18:06:09
# @Last Modified by:   stephenstanwood
# @Last Modified time: 2014-05-19 20:16:54

require "spec_helper"

describe "an admin can manage songs" do
  let!(:beyonce) { Artist.create(
    :name => "Beyonce",
    :genre => "Pop",
    :photo_url => "http://www.tickpick.com/DesktopModules/SearchResults/img/performers/beyonce.jpg"
  )}

  let!(:single_ladies) { Song.create(
    :title => "Single Ladies",
    :video_url => "http://www.youtube.com/watch?v=4m1EFMoRFvY",
    :artist_id => beyonce.id
  )}

  it "can create a new song" do
    visit new_artist_song_path(beyonce)
    fill_in "song_title", with: "Single Ladies"
    fill_in "song_video_url", with: "http://www.youtube.com/watch?v=4m1EFMoRFvY"
    click_button("submit")
    expect(page).to have_content "Single Ladies"
  end

  it "can view an existing artist" do
    visit artist_song_path(beyonce, single_ladies)
    expect(page).to have_content "Single Ladies"
  end

  it "can update a song" do
    visit edit_artist_song_path(beyonce, single_ladies)
    fill_in "song_title", with: "Put A Ring On It!"
    click_button("submit")
    expect(page).to have_content "Put A Ring On It!"
  end

  it "can destroy a song" do
    visit artist_song_path(beyonce, single_ladies)
    click_button("destroy")
    expect(page).to_not have_content("Put A Ring On It!")
  end

end
