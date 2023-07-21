import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/movie_model.dart';

class MovieService {
  final String baseUrl =
      "https://api.themoviedb.org/3/trending/all/day?api_key=";
  final String apiKey =
      "39cf98d7db1ad3069227393fa6315d10"; // Replace with your actual API key

  Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse("$baseUrl$apiKey"));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      print(data);
      List<dynamic> results = data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}
