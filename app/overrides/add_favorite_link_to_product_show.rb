Deface::Override.new(
  virtual_path: 'spree/products/show',
  name: 'add_favorite_link_to_products',
  insert_after: "div[itemprop='description']",
  partial: 'spree/favorites/product_link'
)
