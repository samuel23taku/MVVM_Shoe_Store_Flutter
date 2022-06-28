import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shoe_store/models/shoe.dart';
import 'package:shoe_store/view/screens/view_shoe.dart';

class ShoeCard extends StatelessWidget {
  final Shoe shoe;

  const ShoeCard({super.key, required this.shoe});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ViewShoe(shoe: shoe)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: HexColor("#F6F6F6"),
        ),
        padding: const EdgeInsets.all(12),
        // color: Colors.pink,
        height: 100,
        width: 50,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(shoe.shoeColor,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold))),
                    Checkbox(value: true, onChanged: (value) {})
                  ],
                ),
                const Text(
                  "A pair",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
            Center(child: Image.asset(shoe.shoeImage)),
            Positioned(
                right: 10,
                bottom: 9,
                child: Text(
                  "\$${shoe.shoePrice}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
