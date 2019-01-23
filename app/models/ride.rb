  class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :category
  

    has_attached_file :ride_img, styles: { ride_index: "250x350>", ride_show: "325x475>" }, default_url: "/images/:style/missing.png"
validates_attachment_content_type :ride_img, content_type: /\Aimage\/.*\z/
end
