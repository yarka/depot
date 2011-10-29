class Product < ActiveRecord::Base

  has_many :line_items
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
 
  default_scope :order => 'title'  

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :length => { :minimum => 10 }, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
 
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
