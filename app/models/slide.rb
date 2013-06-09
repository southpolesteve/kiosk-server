class Slide < ActiveRecord::Base
  belongs_to :kiosk
  attr_accessible :display_time, :position, :refresh_time, :url
end
