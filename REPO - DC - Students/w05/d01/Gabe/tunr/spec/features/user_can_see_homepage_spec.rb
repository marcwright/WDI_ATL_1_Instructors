require 'spec_helper'

describe 'user can see a homepage' do

  it 'has the title Tunr' do
    visit root_path
    expect(page).to have_content 'Tunr'
  end

end
