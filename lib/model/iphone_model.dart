
class IphoneProduct {
  final String title, image,price;

  IphoneProduct({
    required this.image,
    required this.title,
    required this.price,
  });
}

// Our iPhone Products

List<IphoneProduct> iPhoneProducts = [
  IphoneProduct(
    image: 'assets/products/iPhone/iphone1.jpeg',
    title: "iPhone 1",
    price: "164,000",
  ),
  IphoneProduct(
    image: "assets/products/iPhone/iphone2.jpeg",
    title: "iPhone 2",
    price: "150,000",
  ),
  IphoneProduct(
    image: "assets/products/iPhone/iphone3.jpeg",
    title: "iPhone 3",
    price: "145,000",
  ),
  IphoneProduct(
    image: "assets/products/iPhone/iphone4.jpeg",
    title: "iPhone 4",
    price: "136,000",
  ),
];
