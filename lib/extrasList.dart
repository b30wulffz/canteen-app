import 'package:flutter/material.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  int currInd = 0;

  final List<Widget> children = [
    Text("Test"),
    Text("GHI"),
    Text("JKL"),
    Text("MNO")
  ];

  switchContent(int index) {
    setState(() {
      this.currInd = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 85,
              child: ListView(
                children: <Widget>[
                  ListIcon(
                      isActive: currInd == 0 ? true : false,
                      func: switchContent,
                      index: 0),
                  ListIcon(
                      isActive: currInd == 1 ? true : false,
                      func: switchContent,
                      index: 1),
                  ListIcon(
                      isActive: currInd == 2 ? true : false,
                      func: switchContent,
                      index: 2),
                  ListIcon(
                      isActive: currInd == 3 ? true : false,
                      func: switchContent,
                      index: 3),
                  ListIcon(
                      isActive: currInd == 4 ? true : false,
                      func: switchContent,
                      index: 4),
                  ListIcon(
                      isActive: currInd == 5 ? true : false,
                      func: switchContent,
                      index: 5),
                  ListIcon(
                      isActive: currInd == 6 ? true : false,
                      func: switchContent,
                      index: 6),
                ],
              ),
            ),
            ItemDetails(),
          ],
        ),
      ),
    );
  }
}

class ListIcon extends StatelessWidget {
  final bool isActive;
  final Function(int) func;
  final int index;
  ListIcon({this.isActive = false, this.func, this.index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func(index);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
          color: isActive ? Colors.grey[200] : Colors.transparent,
        ),
        child: Image.asset('assets/images/burger.png', height: 65),
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Center(
              child: Image.asset(
                'assets/images/burger.png',
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Double Cheeseburger",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Quantity: 100g",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(6),
                    color: Colors.green,
                  ),
                  child: Text(
                    "Veg",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Rs. 150.00",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            // ConstrainedBox(
            //   constraints: BoxConstraints(maxHeight: 105, maxWidth: 10),
            //   child: Container(
            //     margin: EdgeInsets.symmetric(vertical: 5),
            //     padding: EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //       color: Colors.amber,
            //       borderRadius: BorderRadius.circular(15),
            //     ),
            //     child: Icon(Icons.shopping_basket),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed malesuada iaculis quam, a convallis est eleifend ut. Cras urna ante, suscipit sed tincidunt eget, blandit in enim. Ut fringilla nibh at odio tempus, nec aliquam enim viverra. Cras vel luctus odio, accumsan aliquet mi. Nam eget fringilla elit, vel volutpat ipsum. Vivamus sed massa tincidunt, suscipit neque at, vulputate arcu. Quisque ac elementum massa, fermentum tempus leo. Morbi et erat et eros lacinia lobortis sed ut tortor. Duis id purus sed turpis tincidunt scelerisque. Donec eget mollis urna. Fusce condimentum, sapien nec sodales eleifend, nulla magna feugiat urna, eget bibendum orci nunc luctus velit. Fusce rhoncus sapien vitae egestas mollis.",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
