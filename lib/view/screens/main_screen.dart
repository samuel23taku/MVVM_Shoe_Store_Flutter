import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoe_store/constants/shoe_data.dart';
import 'package:shoe_store/view/widgets/shoe_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(FontAwesomeIcons.arrowLeft),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(Icons.menu),
            ),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nike Shoe Store",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFFFFFFF),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                hintText: ' Search',
              ),
            ),
            Expanded(
                child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              physics: BouncingScrollPhysics(),
              itemCount: Constants.shoes.length,
              itemBuilder: (BuildContext context, int index) {
                return ShoeCard(
                  shoe: Constants.shoes[index],
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 250,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              shrinkWrap: true,
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 56,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.bar_chart),
                Icon(FontAwesomeIcons.heart),
                SizedBox(width: 40), // The dummy child
                Icon(FontAwesomeIcons.cartShopping),
                Icon(Icons.settings)
              ]),
        ),
      ),
    );
  }
}
