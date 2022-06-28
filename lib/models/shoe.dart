class Shoe {
  final String shoeImage;
  final String shoeColor;
  final bool isPair;
  final double shoePrice;

  Shoe(
      {required this.shoeImage,
      required this.shoeColor,
      required this.isPair,
      required this.shoePrice});

  factory Shoe.fromJson(Map<String, dynamic> json) {
    return Shoe(
        isPair: json["isPair"],
        shoePrice: json["price"],
        shoeColor: json["shoeColor"],
        shoeImage: json["shoeImage"]);
  }
}
