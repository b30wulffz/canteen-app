import 'package:canteen_app/menu.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // var _screenSize = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.all(25),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlutterLogo(
              size: 70,
            ),
            FlatButton.icon(
              icon: Icon(Icons.shopping_basket),
              label: Text("3"),
              onPressed: () {},
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(20.0)),
              color: Color(0xffFD6C25),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              textColor: Colors.white,
            )
          ],
        ),
        SizedBox(
          height: 40,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            prefixText: '  ',
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            fillColor: Color(0xffF3F3F3),
            filled: true,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 105),
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: <Widget>[
              IconButton(
                icon: Icons.account_balance,
                title: "Click",
                active: true,
                // dest: Menu(),
              ),
              IconButton(
                icon: Icons.account_balance,
                title: "Click",
              ),
              IconButton(
                icon: Icons.account_balance,
                title: "Click",
              ),
              IconButton(
                icon: Icons.account_balance,
                title: "Click",
              ),
              IconButton(
                icon: Icons.account_balance,
                title: "Click",
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "Extras",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: <Widget>[
                        // Positioned(bottom: 0, right: 0,child: Cache,)
                      ],
                    ),
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text("Test"),
                    color: Colors.red,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[Text("hi"), Text("hi")],
            )
          ],
        )
        // FoodCard(),
      ],
    );
  }
}

class IconButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool active;
  final Function dest;

  IconButton({this.icon, this.title, this.active = false, this.dest});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 35),
      child: GestureDetector(
        // enableFeedback: false,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Menu()),
          );
        },
        child: Column(
          children: <Widget>[
            Container(
              child: Icon(icon, size: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: active ? Colors.amber : Colors.grey[300],
              ),
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(bottom: 5),
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// class FoodCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         color: Colors.red,
//         child: Text("hello"),
//       ),
//       flex: 1,
//     );
//   }
// }
