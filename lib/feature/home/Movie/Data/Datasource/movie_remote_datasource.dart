import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:minapharm_task/core/constant.dart';
import 'package:minapharm_task/feature/home/Movie/Data/model/movie_model.dart';

class MovieRemoteDataSource {
  Future<List<Movie>> getMovies() async {
    var response = await http.get(
        Uri.parse("${Constants.baseURL}Top250Movies/${Constants.apiKey}"),
        headers: {
          'Content-type': 'application/json',
        });

    var decodedResponse = json.decode(response.body)['items'] as List;
    return decodedResponse.map((e) => Movie.fromMap(e)).toList();
  }
}
