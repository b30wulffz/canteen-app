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
        child: ListView(
          children: <Widget>[
            ListIcon(
              image: 'assets/images/burger.png',
              title: 'Cheese Burgers',
              desc:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Conssu.',
            ),
            ListIcon(
              image: 'assets/images/burger.png',
              title: 'Cheese Burgers',
              desc:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Conssu.',
              isVeg: false,
            ),
            ListIcon(
              image: 'assets/images/burger.png',
              title: 'Cheese Burgers',
              desc:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Conssu',
            ),
            ListIcon(
              image: 'assets/images/burger.png',
              title: 'Cheese Burgers',
              desc:
                  'Lorem ipsum dolor sit amet consectetur adipisicing elit. Conssu.',
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}

class ListIcon extends StatelessWidget {
  final bool isLast;
  final String image;
  final String title;
  final String desc;
  final bool isVeg;
  ListIcon(
      {this.image,
      this.title,
      this.desc = '',
      this.isLast = false,
      this.isVeg = true});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                // border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20),
                // color: Colors.grey[200],
              ),
              child: Image.asset(this.image, height: 65),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.title,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    this.desc,
                    style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              width: 20,
              height: 20,
              decoration: BoxDecoration(),
              child: CustomPaint(
                painter: Circle(isVeg: this.isVeg),
              ),
            )
          ],
        ),
        Divider(
          thickness: isLast ? 0 : 2,
        )
      ],
    );
  }
}

class Circle extends CustomPainter {
  final bool isVeg;
  Circle({this.isVeg = true});

  @override
  void paint(Canvas canvas, Size size) {
    final Color colVal = isVeg ? Colors.green : Colors.red;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 5, Paint()..color = colVal);
    canvas.drawLine(
        Offset(0, 0),
        Offset(0, size.height),
        Paint()
          ..strokeWidth = 2
          ..color = colVal);
    canvas.drawLine(
        Offset(0, 0),
        Offset(size.width, 0),
        Paint()
          ..strokeWidth = 2
          ..color = colVal);
    canvas.drawLine(
        Offset(size.width, 0),
        Offset(size.width, size.height),
        Paint()
          ..strokeWidth = 2
          ..color = colVal);
    canvas.drawLine(
        Offset(size.width, size.height),
        Offset(0, size.height),
        Paint()
          ..strokeWidth = 2
          ..color = colVal);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
