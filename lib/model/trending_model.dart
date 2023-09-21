
class Product {
  final String title, image, price;

  Product({
    required this.image,
    required this.title,
    required this.price,
  });
}

// Our trending Products

List<Product> trendingProducts = [
  Product(
    image: 'assets/products/headphone/headphone8.jpeg',
    title: "HeadPhone",
    price: "6,400",
  ),
  Product(
    image: "assets/products/iPhone/iphone3.jpeg",
    title: "iPhone",
    price: "150,000",
  ),
  Product(
    image: "assets/products/sumsung/samsung2.jpeg",
    title: "Samsung",
    price: "450,000",
  ),
  Product(
    image: "assets/products/headphone/headphone6.jpeg",
    title: "HeadPhone",
    price: "3,600",
  ),
];
