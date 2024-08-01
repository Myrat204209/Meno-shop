enum RouteNames {
  home('/home'),
  notifications('notifications'),
  productDetails('products/:uuid'),
  category('/category'),
  cart('/cart'),
  favorites('/favorites'),
  profile('/profile'),
  account('account'),
  addresses('addresses'),
  orders('orders'),
  categoryProducts('/category_products');

  const RouteNames(this.path);
  final String path;
}
