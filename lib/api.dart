import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'model/product.dart';

final fetchProductProvider = Provider((ref) => FetchProduct());

class FetchProduct {
  getProdcut(input) async {
    try {
      var res =
          await http.get(Uri.parse('https://fakestoreapi.com/products/$input'));

      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        var getData = Product.fromJson(response);
        return getData;
      }
    } catch (e) {
      print("ee" + e.toString());
    }
    return null;
  }
}
