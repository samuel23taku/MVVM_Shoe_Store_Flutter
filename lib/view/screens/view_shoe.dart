// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../models/shoe.dart';

class ViewShoe extends StatefulWidget {
  final Shoe shoe;
  const ViewShoe({Key? key, required this.shoe}) : super(key: key);

  @override
  State<ViewShoe> createState() => _ViewShoeState();
}

class _ViewShoeState extends State<ViewShoe> with TickerProviderStateMixin {
  late AnimationController shoeAnimationController;
  late Animation<Offset> shoeAnimationOffset;
  @override
  void initState() {
    super.initState();
    shoeAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    shoeAnimationOffset =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(shoeAnimationController);
  }

  @override
  void dispose() {
    shoeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    shoeAnimationController.forward();
    Shoe shoe = widget.shoe;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(FontAwesomeIcons.arrowLeft)),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.menu),
            ),
          ]),
      body: Column(
        children: [
          SlideTransition(
              position: shoeAnimationOffset,
              child: Image.asset(widget.shoe.shoeImage)),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  shoe.shoeColor,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 35),
                ),
                const Text(
                  "Pair",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 20),
                ),
                Row(
                  children: [
                    const Expanded(child: SizedBox()),
                    Text(
                      "\$${shoe.shoePrice}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 25),
                    )
                  ],
                ),
                const Text(
                  "Product Description",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const Text(
                  "loren adsfasdflkasjdflkajsdflkjkd ajdflkjasdlfkjasdlk fjlksad" +
                      "jflaksdjf askdj faskdjfkasdjf alsd alsd;kjflsakdjf lkasdjfl;askdjf klsdkfjaskdfj sdjflaksdjf kasdjf kjdkla asdjfkjf laskdjf laskdjflksa jfdsalk fjasdlkjf asdkfjalsdkla.",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(18),
                      child: Icon(
                        FontAwesomeIcons.solidHeart,
                        color: HexColor("35EDA0"),
                      ),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          border: Border.all(color: HexColor("35EDA0"))),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Padding(
                          padding: EdgeInsets.all(19.0),
                          child: Text("Add to cart"),
                        ))
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
