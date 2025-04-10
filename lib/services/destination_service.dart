import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/destination.dart';

class DestinationService {
  // ✅ URL API thật bạn vừa tạo trên Mocki
  static const _endpoint =
      'https://mocki.io/v1/2a3292e1-0aa3-49f1-a019-91722fca60ae';

  Future<List<Destination>> fetchAll() async {
    final res = await http.get(Uri.parse(_endpoint));
    if (res.statusCode != 200) {
      throw Exception('API error ${res.statusCode}');
    }

    final list = jsonDecode(res.body) as List;
    return list.map((e) => Destination.fromJson(e)).toList();
  }
}
