class Product {
  final String name;
  final double grammage;
  final String description;
  final String imagePath;
  final String color;
  final String size;
  final int quantity;
  final String? userEmail;
  //final bool isFavorited;
  /*String selectedColor;
  String selectedSize;
  int selectedQuantity;*/

  Product ({
    required this.name,
    required this.grammage,
    required this.description,
    required this.imagePath,
    required this.color,
    required this.size,
    required this.quantity,
    required this.userEmail,
    //required this.isFavorited,
    /*this.selectedColor = '',
    this.selectedSize = '',
    this.selectedQuantity = 0,*/
  });
  static List<Product> ProductList = [
    Product(
        name: "K648",
        grammage: 4.50,
        imagePath: "assets/resimler/H648.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        //isFavorated: true,
        //isSelected: false
    ),
    Product(
        name: "K873",
        grammage: 5.90,
        imagePath: "assets/resimler/H873.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        //isFavorated: true,
        //isSelected: false
    ),
    Product(
        name: "K890",
        grammage: 3.70,
        imagePath: "assets/resimler/H890.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        //isFavorated: true,
        //isSelected: false
    ),
    Product(
        name: "K1088",
        grammage: 4.70,
        imagePath: "assets/resimler/H1088.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        //isFavorated: true,
        //isSelected: false
    ),
    Product(
        name: "K1220",
        grammage: 2.80,
        imagePath: "assets/resimler/H1220.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        //isFavorated: true,
        //isSelected: false
    ),
    Product(
        name: "K1931",
        grammage: 2.20,
        imagePath: "assets/resimler/H1931.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        //isFavorated: true,
        //isSelected: false
    ),
    Product(
        name: "K495",
        grammage: 7.00,
        imagePath: "assets/resimler/HV495.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        //isFavorated: true,
        //isSelected: false
    ),

    Product(
        name: "K493",
        grammage: 20.00,
        imagePath: "assets/resimler/HV493.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K2032",
        grammage: 6.20,
        imagePath: "assets/resimler/H2032.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K2117",
        grammage: 5.15,
        imagePath: "assets/resimler/H2117.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K2119",
        grammage: 2.60,
        imagePath: "assets/resimler/H2119.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K1593",
        grammage: 21.00,
        imagePath: "assets/resimler/H1593.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K2116",
        grammage: 1.70,
        imagePath: "assets/resimler/H2116.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K2061",
        grammage: 2.30,
        imagePath: "assets/resimler/H2061.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K2087",
        grammage: 1.20,
        imagePath: "assets/resimler/YLDZ2087.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K2088",
        grammage: 0.80,
        imagePath: "assets/resimler/YLDZ2088.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K2097",
        grammage: 1.50,
        imagePath: "assets/resimler/YLDZ2097.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K2104",
        grammage: 2.00,
        imagePath: "assets/resimler/YLDZ2104.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K1437",
        grammage: 0.80,
        imagePath: "assets/resimler/HV1437.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
       ),

    Product(
        name: "K867",
        grammage: 0.80,
        imagePath: "assets/resimler/HV867.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
       ),

    Product(
        name: "K1019",
        grammage: 0.80,
        imagePath: "assets/resimler/HV1019.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K236",
        grammage: 0.80,
        imagePath: "assets/resimler/HV236.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K1512",
        grammage: 0.80,
        imagePath: "assets/resimler/HA1512.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
       ),

    Product(
        name: "K2091",
        grammage: 0.80,
        imagePath: "assets/resimler/HA2091.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K2092",
        grammage: 0.80,
        imagePath: "assets/resimler/HA2092.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K2121",
        grammage: 0.80,
        imagePath: "assets/resimler/HA2121.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K1856",
        grammage: 0.80,
        imagePath: "assets/resimler/KP1856.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        ),

    Product(
        name: "K913",
        grammage: 0.80,
        imagePath: "assets/resimler/KP913.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
       ),

    Product(
        name: "K1354",
        grammage: 0.80,
        imagePath: "assets/resimler/KP1354.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
    ),

    Product(
        name: "K1235",
        grammage: 0.80,
        imagePath: "assets/resimler/KP1235.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        //isFavorated: true,
        //isSelected: false
    ),

    Product(
        name: "K2005",
        grammage: 0.80,
        imagePath: "assets/resimler/KP2005.png",
        color: "white",
        size: "8",
        quantity: 0,
        description: "",
        userEmail: "",
        //isFavorated: true,
        //isSelected: false
    ),
  ];

  @override
  String toString() {
    return 'Product(name: $name, grammage: $grammage, description: $description, imagePath: $imagePath, color: $color, size: $size, quantity: $quantity,)';
  }
}