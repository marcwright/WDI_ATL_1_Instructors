require 'spec_helper'

describe ApplicationHelper do

  describe "#ye_er" do
    it "should ye your name" do
      name = 'jonny'
      expect(ye_er(name)).to eq('jonnye')
    end
    it "chops of the y if the name ends in a y" do
      name = 'Mary'
      expect(ye_er(name)).to eq('Marye')
    end
  end
end

describe PagesHelper do
  describe "#pages_link" do
     it "should be a link to /pages" do

    end
  end

  describe "#brand_name" do

  end

  describe "#yeface" do
    it "should print out a face kanye west" do
      expect(helper.yeface.html_safe?).to be_true
      @tag = image_tag('http://livingcivil.com/wp-content/uploads/2013/09/Kanye-West-face-13.jpg')
      expect(helper.yeface).to eq(@tag)
    end
  end

  describe '#bs_link' do
    it "should print out a bootstrapped themed link to somewhere" do
      link = 'google.com'
      link_name = 'link'
      type = 'warning'
      expect(helper.bs_link(link, link_name, type)).to eq('<a class="btn btn-warning btn-lg" href="google.com">link</a>')
    end

  end
end
