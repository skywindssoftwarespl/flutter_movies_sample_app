import 'dart:convert';
import 'dart:io';

import 'package:demo/core/common/widget/toast.dart';
import 'package:demo/core/network/api.dart';
import 'package:demo/src/modules/Home/model/movie_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  //API call to get list of movie
  Future<MoviesModel> fetchData() async {
    try {
      final response = await http.get(Uri.parse(API.MovieAllApi));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return MoviesModel.fromJson(data);
      } else {
        // handle http error
        showToast(msg: "Http Error ${response.statusCode}");
        throw HttpException('Failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      showToast(msg: "Error API: ${e}");
      print('Unexpected error: $e');

      throw e;
    }
  }
}
