class Product < ActiveRecord::Base
  image_accessor :cover_image   
  default_scope :order => 'title'
  validates :title, :description, :cover_image, :presence => true
  validates :cover_image, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true, :length => { :minimum => 10 }
 # validates :image_url, :format => {
   # :with  => %r{\.(gif|jpg|png)$}i,
    #:message => 'Error! must be a URL for GIF, JPG or PNG image'
#}
 validates_property :format, :of => :cover_image, :in => [:jpg, :png, :gif]
end
