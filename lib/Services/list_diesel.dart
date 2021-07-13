import 'dart:convert';

import 'package:turkish_gasoline_and_diesel_price_app/Models/turkey_diesel.dart';
import 'package:http/http.dart' as http;

class DieselService {
  Future<List<ResultClass>> getDieselPrice() async {
    final response = await http.get(
        Uri.parse(
            'https://api.collectapi.com/gasPrice/turkeyDiesel?district=kadikoy&city=istanbul'),
        headers: {
          "authorization":
              "apikey 489xujAOeE4I91bi4KY1Tb:5YFKt91upfbqohlOPA8EJU",
          "content-type": "application/json"
        });

    if (response.statusCode == 200) {
      final list = (jsonDecode(response.body)["result"] as List).map((sonuc) {
        return ResultClass.fromJson(sonuc);
      }).toList();
      return list;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load price');
    }
  }
}
