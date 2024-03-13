import 'package:popular_movie_mvvm/models/movie_category_model.dart';
import 'package:popular_movie_mvvm/models/movie_model.dart';
import 'package:popular_movie_mvvm/services/popular_movie_service.dart';

class HomeRepository {

  static Future<MovieModel> getPopularMovie(int page) async {
    return await PopularMovieService.getPopularMovie(page);
  }

  static Future<MovieCategoryModel> getGenres() async {
    return await PopularMovieService.getGenres();
  }

}