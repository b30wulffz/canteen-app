import 'package:flutter/material.dart';

class MessFeedback extends StatelessWidget {
  Future<String> getFeedback(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Enter Monthly Feedback",
            ),
            content: TextField(
              controller: customController,
              maxLines: 4,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: new BorderSide())),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "Submit",
                  // style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop(customController.text.toString());
                },
              ),
              FlatButton(
                child: Text(
                  "Cancel",
                  // style: TextStyle(color: Colors.orange, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        getFeedback(context).then((val) {
          SnackBar mySnackBar = SnackBar(
            // backgroundColor: Colors.orange,
            duration: Duration(milliseconds: 800),
            content: Text(
              val.length > 0
                  ? "Feedback Submitted Successfully!"
                  : "Error! Feedback cannot be empty",
              style:
                  TextStyle(color: val.length > 0 ? Colors.green : Colors.red),
            ),
          );
          Scaffold.of(context).showSnackBar(mySnackBar);
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text("Submit Feedback"),
        color: Colors.red,
      ),
    );
  }
}
