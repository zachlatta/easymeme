class Meme < ActiveRecord::Base

  before_save {
    self.title = title.downcase
    self.top_text = top_text.downcase
    self.bottom_text = bottom_text.downcase
  }
  
  validates_presence_of :title, :url
  validates :top_text,    presence: { if: bottom_text.blank? }
  validates :bottom_text, presence: { if: top_text.blank? }
end
