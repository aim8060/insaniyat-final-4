class Post < ApplicationRecord
	belongs_to :user
	has_attached_file :image, styles: { large: "440x440>",medium: "320x320>", thumb: "170x170>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
