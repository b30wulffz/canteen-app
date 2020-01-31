import 'package:canteen_app/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String host = "localhost:8000";
const String protocol = "http";

//Future<String> get

class MenuRequests {
  static Future<MenuFull> getMenus() async {
    http.Response res =
        await http.get("$protocol://$host/api/menu/", headers: {"Accept": "application/json"});
    return MenuFull.fromJSON(json.decode(utf8.decode(res.body.codeUnits)));
  }
}
