require 'spec_helper'

describe Meme do

  before do
    @meme = FactoryGirl.create(:meme)
  end

  subject { @meme }

  it { should respond_to(:title) }
  it { should respond_to(:top_text) }
  it { should respond_to(:bottom_text) }
  it { should respond_to(:image) }

  it { should be_valid }

  describe "when title is not present" do

    before { @meme.title = " " }
    it { should_not be_valid }
  end

  describe "when top and bottom text are not present" do

    before {
      @meme.top_text = " "
      @meme.bottom_text = " "
    }
    it { should_not be_valid }
  end

  describe "when image is not present" do
  end
end
