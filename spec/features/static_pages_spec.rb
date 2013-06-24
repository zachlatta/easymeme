require 'spec_helper'

describe "static pages" do

  subject { page }

  describe "home page" do

    before { visit root_path }

    it { should have_selector('a', text: 'Easymeme') }
    it { should have_title(full_title('')) }
  end

  describe "about page" do
    
    before { visit about_path }

    it { should have_selector('h1', text: 'About') }
    it { should have_title(full_title('About')) }
  end

  it "should have the right links on the layout" do

    visit root_path
    click_link "About"
    page.should have_title(full_title('About'))
    click_link "Home"
    page.should have_title(full_title(''))
  end
end
