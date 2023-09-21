
class SamsungProduct {
  final String title, image, price;

  SamsungProduct({
    required this.image,
    required this.title,
    required this.price,
  });
}

// Our samsung Products

List<SamsungProduct> samsungProducts = [
  SamsungProduct(
    image: 'assets/products/sumsung/samsung1.jpeg',
    title: "Samsung 1",
    price: "540,000",
  ),
  SamsungProduct(
    image: "assets/products/sumsung/samsung2.jpeg",
    title: "Samsung 2",
    price: "800,000",
  ),
  SamsungProduct(
    image: "assets/products/sumsung/samsung3.jpeg",
    title: "Samsung 3",
    price: "950,000",
  ),
  SamsungProduct(
    image: "assets/products/sumsung/samsung4.jpeg",
    title: "Samsung 4",
    price: "500,000",
  ),
];
