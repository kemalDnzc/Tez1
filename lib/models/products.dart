class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;
  final String color;
  final String size;
  final int quantity;
  /*String selectedColor;
  String selectedSize;
  int selectedQuantity;*/

  Product ({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.color,
    required this.size,
    required this.quantity,
    /*this.selectedColor = '',
    this.selectedSize = '',
    this.selectedQuantity = 0,*/
  });

  @override
  String toString() {
    return 'Product(name: $name, price: $price, description: $description, imagePath: $imagePath, color: $color, size: $size, quantity: $quantity)';
  }
}