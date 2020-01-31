import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: Text(
                  "History",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: <Widget>[
                    ListIcon(
                      image: 'assets/images/burger.png',
                      title: 'Cheese Burgers',
                      quantity: 1,
                      cost: 120.33,
                      txnId: '120-563-123',
                    ),
                    ListIcon(
                      image: 'assets/images/burger.png',
                      title: 'Cheese Burgers',
                      quantity: 1,
                      cost: 120.33,
                      txnId: '120-563-123',
                    ),
                    ListIcon(
                      image: 'assets/images/burger.png',
                      title: 'Cheese Burgers',
                      quantity: 1,
                      cost: 120.33,
                      txnId: '120-563-123',
                      isLast: true,
                    ),
                  ],
                ),
              ),
            )
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
  final int quantity;
  final double cost;
  final String txnId;
  ListIcon({
    this.image,
    this.title,
    this.quantity,
    this.cost,
    this.txnId,
    this.isLast = false,
  });
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
              flex: 2,
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
                    "Txn ID: " + this.txnId,
                    style: TextStyle(fontSize: 17, color: Colors.grey[500]),
                  ),
                  Text(
                    "x" + this.quantity.toString(),
                    style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "₹ " + this.cost.toString(),
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
          ],
        ),
        Divider(
          thickness: isLast ? 0 : 2,
        )
      ],
    );
  }
}
