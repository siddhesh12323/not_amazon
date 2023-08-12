class Product {
  Product(
      {required this.name,
      required this.description,
      required this.images,
      required this.rating,
      this.isCart = false,
      this.isFavorite = false,
      this.noInCart = 0,
      required this.price,
      required this.ramStorageOptions,
      required this.url});

  String name;
  String description;
  List<double> price;
  bool isCart;
  bool isFavorite;
  List<String> images;
  double rating;
  int noInCart;
  String url;
  List<String> ramStorageOptions;
}

List<Product> products = [
  Product(
      name: "Xiaomi 13 Ultra",
      description: "2023 flagship from Xiaomi",
      images: [
        "assets/13ultra/13ultra(1).png",
        "assets/13ultra/13ultra(2).png",
        "assets/13ultra/13ultra(3).png",
        "assets/13ultra/13ultra(4).png"
      ],
      rating: 4.2,
      price: [899.00, 1049.00, 1199.00],
      ramStorageOptions: ["12GB - 256GB", "16GB - 512GB", "16GB - 1TB"],
      url: 'https://www.mi.com/global/product/xiaomi-13-ultra/'),
  Product(
      name: "iPhone 14 Pro Max",
      description: "2023 flagship from Apple",
      images: [
        "assets/14promax/14promax(1).png",
        "assets/14promax/14promax(2).png",
        "assets/14promax/14promax(3).png",
        "assets/14promax/14promax(4).png"
      ],
      rating: 4.6,
      price: [1099.00, 1199.00, 1399.00, 1599.00],
      ramStorageOptions: ["128GB", "256GB", "512GB", "1TB"],
      url: 'https://www.apple.com/iphone-14-pro/'),
  Product(
      name: "Oppo Find X6 Pro",
      description: "2023 flagship from Oppo",
      images: [
        "assets/findx6pro/findx6pro(1).png",
        "assets/findx6pro/findx6pro(2).png",
        "assets/findx6pro/findx6pro(3).png",
        "assets/findx6pro/findx6pro(4).png"
      ],
      rating: 4.7,
      price: [999.00, 1099.00, 1199.00],
      ramStorageOptions: ["12GB - 256GB", "16GB - 256GB", "16GB - 512GB"],
      url: 'https://www.oppo.com/cn/smartphones/series-find-x/find-x6-pro/'),
  Product(
      name: "Samsung Galaxy S23 Ultra",
      description: "2023 flagship from Samsung",
      images: [
        "assets/s23ultra/s23ultra(1).png",
        "assets/s23ultra/s23ultra(2).png",
        "assets/s23ultra/s23ultra(3).png",
        "assets/s23ultra/s23ultra(4).png"
      ],
      rating: 4.5,
      price: [1199.00, 1379.00, 1619.00],
      ramStorageOptions: ["12GB - 256GB", "12GB - 512GB", "12GB - 1TB"],
      url: 'https://www.samsung.com/us/smartphones/galaxy-s23-ultra/'),
  Product(
      name: "Vivo X90 Pro Plus",
      description: "2023 flagship from Vivo",
      images: [
        "assets/x90proplus/x90proplus(1).png",
        "assets/x90proplus/x90proplus(2).png",
        "assets/x90proplus/x90proplus(3).png",
        "assets/x90proplus/x90proplus(4).png"
      ],
      rating: 4.3,
      price: [999.00, 1099.00],
      ramStorageOptions: ["12GB - 256GB", "12GB - 512GB"],
      url: 'https://www.vivo.com.cn/vivo/x90proplus/'),
];
