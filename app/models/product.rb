class Product < ActiveRecord::Base
 
  image_accessor :cover_image

  has_many :line_items
   
  default_scope :order => 'title'  

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :cover_image, :presence => true
  validates :cover_image, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true, :length => { :minimum => 10 } 
  validates_property :format, :of => :cover_image, :in => [:jpg, :png, :gif]
 
  private

    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
