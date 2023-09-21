
class HeadPhoneProduct {

  final String title, image, price;

  HeadPhoneProduct({
    required this.image,
    required this.title,
    required this.price,
  });
}

// Our headphone Products

List<HeadPhoneProduct> headphoneProducts = [
  HeadPhoneProduct(
    image: 'assets/products/headphone/headphone1.jpeg',
    title: "Headphone 1",
    price: "3,400",
  ),
  HeadPhoneProduct(
    image: "assets/products/headphone/headphone2.jpeg",
    title: "Headphone 2",
    price: "5,000",
  ),
  HeadPhoneProduct(
    image: "assets/products/headphone/headphone3.jpeg",
    title: "Headphone 3",
    price: "6,500",
  ),
  HeadPhoneProduct(
    image: "assets/products/headphone/headphone4.jpeg",
    title: "Headphone 4",
    price: "3,000",
  ),
];
