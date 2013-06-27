require 'spec_helper'

describe "static pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_content(heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "home page" do

    before { visit root_path }

    let(:heading)    { 'Easymeme' }
    let(:page_title) { '' }
  end

  describe "about page" do
    
    before { visit about_path }

    let (:heading)   { 'About' }
    let(:page_title) { full_title('About') }
  end

  it "should have the right links on the layout" do

    visit root_path
    click_link "About"
    page.should have_title(full_title('About'))
    click_link "Home"
    page.should have_title(full_title(''))
  end
end
