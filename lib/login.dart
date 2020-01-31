import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final _formKeylogin = GlobalKey<FormState>();
  final _formKeysign = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var _user, _name = null, _pass;
    var _screensize = MediaQuery.of(context).size;
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffffc04c),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.directions_car),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Tab(
                    icon: Icon(Icons.directions_transit),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18),
                    )),
              ],
            ),
          ),
          body: TabBarView(children: [
            Padding(
              padding: EdgeInsets.all(50),
              child: Container(
                child: Form(
                  key: _formKeylogin,
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.person), labelText: "Username"),
                        onSaved: (value) {
                          setState(() {
                            _user = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key), labelText: "Password"),
                        obscureText: true,
                        onSaved: (value) {
                          setState(() {
                            _pass = value;
                          });
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 40,
                        child: RaisedButton(
                          onPressed: () {
                            _formKeylogin.currentState.save();
                            print(_user);
                          },
                          child: Text("Login"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(50),
              child: Container(
                child: Form(
                  key: _formKeysign,
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.person), labelText: "Name"),
                        onSaved: (value) {
                          setState(() {
                            _name = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.mail), labelText: "Email-Id"),
                        onSaved: (value) {
                          setState(() {
                            _user = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key), labelText: "Password"),
                        obscureText: true,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.vpn_key),
                            labelText: "Confirm Password"),
                        obscureText: true,
                        onSaved: (value) {
                          setState(() {
                            _pass = value;
                          });
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        width: 40,
                        child: RaisedButton(
                          onPressed: () {
                            if (_formKeysign.currentState.validate()) {
                              _formKeysign.currentState.save();
                            }
                          },
                          child: Text("Create Account"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
