require 'spec_helper'

describe 'User can see a homepage' do

  it 'has the title Tunr' do
    visit root_path#(This is a rails path helper)
    expect(page).to have_content 'Tunr'
  end

end


