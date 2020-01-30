import 'package:canteen_app/extrasList.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int currInd = 0;
  final List<Widget> children = [
    MenuList(),
    Text("GHI"),
    Text("JKL"),
    Text("MNO")
  ];
  switchPage(int index) {
    setState(() {
      this.currInd = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      BackButton(),
                      Text(
                        "Sunday",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                TopBar(switchPage, currInd),
                children[currInd]
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20))),
                width: 80,
                height: 80,
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          Icons.arrow_back_ios,
          size: 15,
        ),
      ),
    );
  }
}

class TopBar extends StatefulWidget {
  final Function(int) switchPage;
  final int currInd;
  TopBar(this.switchPage, this.currInd);
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        TopBarButton(
          title: "Breakfast",
          isActive: widget.currInd == 0 ? true : false,
          func: widget.switchPage,
          index: 0,
        ),
        TopBarButton(
          title: "Lunch",
          isActive: widget.currInd == 1 ? true : false,
          func: widget.switchPage,
          index: 1,
        ),
        TopBarButton(
          title: "Snacks",
          isActive: widget.currInd == 2 ? true : false,
          func: widget.switchPage,
          index: 2,
        ),
        TopBarButton(
          title: "Dinner",
          isActive: widget.currInd == 3 ? true : false,
          func: widget.switchPage,
          index: 3,
        )
      ],
    );
  }
}

class TopBarButton extends StatelessWidget {
  final bool isActive;
  final String title;
  final Function(int) func;
  final int index;
  TopBarButton({this.title, this.isActive = false, this.func, this.index});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        func(index);
      },
      child: Container(
        child: CustomPaint(
          painter: DrawCircle(isActive ? Colors.orange : Colors.transparent),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: isActive ? FontWeight.bold : null,
                  color: isActive ? Colors.black : Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawCircle extends CustomPainter {
  final Color _color;
  DrawCircle(this._color);

  @override
  void paint(Canvas canvas, Size size) {
    Offset c = Offset(size.width / 2, size.height);
    Paint p = Paint()..color = this._color;
    canvas.drawCircle(c, 3, p);
  }

  @override
  bool shouldRepaint(DrawCircle oldDelegate) {
    return (oldDelegate._color != this._color);
  }
}
