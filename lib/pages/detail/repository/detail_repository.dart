import 'package:hive/hive.dart';
import 'package:popular_movie_mvvm/models/movie_detail_model.dart';
import 'package:popular_movie_mvvm/models/movie_review_model.dart';
import 'package:popular_movie_mvvm/services/popular_movie_service.dart';

class DetailRepository {

  static Future<MovieDetailModel> getMovieDetail(movieId) async {
    return await PopularMovieService.getMovieDetail(movieId);
  }

  static Future<MovieReviewModel> getMovieReview(movieId) async {
    return await PopularMovieService.getMovieReview(movieId);
  }

  static addToFavorite(movieId, movieTitle, movieOverview) {
    var box = Hive.box('favorites');
    box.put(movieId, {
      'movieId': movieId,
      'movieTitle': movieTitle,
      'movieOverView': movieOverview
    });
  }
}