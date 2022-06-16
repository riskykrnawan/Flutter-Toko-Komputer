import 'produk.dart';

class ProductsRepository {
  static const products = <Product>[
    Product(
      category: Category.laptop,
      id: 1,
      name: "MSI GX 405",
      price: 340000,
      stock: 12,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley. ",
      image: "assets/images/laptop1.png",
    ),
    Product(
      category: Category.laptop,
      id: 2,
      name: "ACER NITRO 5",
      price: 450000,
      stock: 8,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
      image: "assets/images/laptop2.png",
    ),
    Product(
      category: Category.laptop,
      id: 3,
      name: "ASUS ROG POTATO R15",
      price: 120000,
      stock: 10,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
      image: "assets/images/laptop3.png",
    ),
    Product(
      category: Category.laptop,
      id: 4,
      name: "ASUS ROG STRIX G15",
      price: 230000,
      stock: 11,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
      image: "assets/images/laptop4.png",
    ),
    Product(
      category: Category.vga,
      id: 5,
      name: "RTX 9090 TI",
      price: 45000,
      stock: 13,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
      image: "assets/images/vga1.png",
    ),
    Product(
      category: Category.vga,
      id: 6,
      name: "RTX 9999 XTI",
      price: 32000,
      stock: 12,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
      image: "assets/images/vga2.png",
    ),
  ];

  static List<Product> loadProducts(Category category) {
    if (category == Category.all) {
      return products;
    } else {
      return products.where((p) => p.category == category).toList();
    }
  }
}

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
