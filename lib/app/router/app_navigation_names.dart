enum RouteNames {
  home('/home'),
  notifications('notifications'),
  productDetails('/products_details/:uuid'),
  category('/category'),
  cart('/cart'),
  favorites('/favorites'),
  profile('/profile'),
  account('account'),
  addresses('addresses'),
  auth('/auth'),
  checkout('checkout'),
  authVerify('authVerify'),
  orders('orders'),
  orderInformation('orders_information'),
  products('/products/:uuid');

  const RouteNames(this.path);
  final String path;
}
