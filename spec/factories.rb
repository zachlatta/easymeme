FactoryGirl.define do
  factory :meme do
    title       "Bad Luck Brian"
    top_text    "Gets a pEt Rock"
    bottom_text "iT runs AWAY"

    image { fixture_file_upload('spec/fixtures/files/bad_luck_brian.png',
                                'image/png') }
  end
end
