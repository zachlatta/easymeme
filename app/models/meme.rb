class Meme < ActiveRecord::Base

  before_save {
    self.title = title.downcase
    self.top_text = top_text.downcase
    self.bottom_text = bottom_text.downcase
  }

  has_attached_file :image, {
    :styles => { :view => "500x500>",
                 :thumb => "200x200>" },
    :url => "/memes/src/:hash.:extension",
    :hash_secret => "lol_1_d0n't_c4r3_1f_y0u_kn0w_th3_s3cr3T",
  }
 
  validates_presence_of :title
  validates :top_text,    presence: { unless: :bottom_text? }
  validates :bottom_text, presence: { unless: :top_text? }
  validates_attachment :image, presence: true, size: { in: 0..10.megabytes }
end
