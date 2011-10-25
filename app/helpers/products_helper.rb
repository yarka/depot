module ProductsHelper

  def image_for(product, resolution='60x70')
	if product.cover_image
	  img = image_tag(product.cover_image.thumb(resolution).url,
			   {:alt => product.title})
	  link_to(img, product.cover_image.url)
	end
  end
end
