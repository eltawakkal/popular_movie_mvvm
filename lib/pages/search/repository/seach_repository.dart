import 'package:popular_movie_mvvm/models/movie_search_model.dart';
import 'package:popular_movie_mvvm/services/popular_movie_service.dart';

class SearchRepository {

  static Future<MovieSearchModel> searchMovie(String movieName) async {
    return await PopularMovieService.searchMovie(movieName);
  }

}