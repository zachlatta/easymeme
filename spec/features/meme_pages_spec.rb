require 'spec_helper'

describe "meme pages" do

  subject { page }

  describe "new page" do
    before { visit new_path }

    it { should have_selector('h1', text: 'New Meme'.titleize) }
    it { should have_title(full_title('New Meme').titleize) }
  end

  describe "view page" do
    let(:meme) { FactoryGirl.create(:meme) }

    before { visit meme_path(meme) }

    it { should have_selector('h1', meme.title.titleize) }
    it { should have_title(full_title(meme.title.titleize)) }
  end

  describe "new" do
    before { visit new_path }

    let(:submit) { "Create Meme" }

    describe "with invalid information" do
      describe "with empty fields" do
        it "should not create a new meme" do
          expect { click_button submit }.not_to change(Meme, :count)
        end

        describe "after submission" do
          before { click_button submit }

          it { should have_selector('h1', "New Meme".titleize) }
          it { should have_content('error') }
        end
      end
    end

    describe "with valid information" do

      describe "with bottom field empty" do

        before do
          fill_in "Title", with: "Title goes here"
          fill_in "Top text", with: "This is a meme"
        end

        it "should create a new meme" do
          expect { click_button submit }.to change(Meme, :count).by(1)
        end

        describe "after saving a meme" do
          before { click_button submit }

          let(:meme) { Meme.last }

          it { should have_title(full_title(meme.title.titleize)) }
          it { should have_selector('div.alert.alert-success') }
        end
      end

      describe "with no fields empty" do

        before do
          fill_in "Title",       with: "Bad Luck Brian"
          fill_in "Top text",    with: "Has a pet rock"
          fill_in "Bottom text", with: "Runs away"
        end

        it "should create a new meme" do
          expect { click_button submit }.to change(Meme, :count).by(1)
        end

        describe "after saving a meme" do
          before { click_button submit }

          let(:meme) { Meme.last }

          it { should have_title(full_title(meme.title.titleize)) }
          it { should have_selector('div.alert.alert-success') }
        end
      end
    end
  end
end
