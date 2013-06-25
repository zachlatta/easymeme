require 'spec_helper'

describe Meme do

  before { @meme = Meme.new(title: "bad luck brian",
                            top_text: "has a pet rock",
                            bottom_text: "it runs away",
                            url: "http://i.imgur.com/xpeoxxh.jpg") }

  subject { @meme }

  it { should respond_to(:title) }
  it { should respond_to(:top_text) }
  it { should respond_to(:bottom_text) }
  it { should respond_to(:url) }

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
end
