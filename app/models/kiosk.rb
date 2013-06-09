class Kiosk < ActiveRecord::Base
  attr_accessible :cpu_id, :slides_attributes

  has_many :slides

  accepts_nested_attributes_for :slides, :reject_if => :all_blank, :allow_destroy => true

  state_machine :state, :initial => :new do

    event :default_configured do
      transition :new => :default
    end

  end

  def config
    slides.sort_by(&:position).map(&:attributes)
  end

end
