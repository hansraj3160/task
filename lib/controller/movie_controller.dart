
import 'package:get/get.dart';

import '../model/movie_model.dart';
import '../services/movie_service.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  var movies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  void fetchMovies() async {
    try {
      isLoading(true);
      var movieService = MovieService();
      var fetchedMovies = await movieService.fetchMovies();
      movies.value = fetchedMovies;
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
