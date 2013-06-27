require 'spec_helper'

describe "meme pages" do

  subject { page }

  describe "new page" do
    before { visit new_path }

    it { should have_content('New Meme') }
    it { should have_title(full_title('New Meme')) }
  end
end
