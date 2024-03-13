import 'package:dio/dio.dart';
import 'package:popular_movie_mvvm/models/movie_category_model.dart';
import 'package:popular_movie_mvvm/models/movie_detail_model.dart';
import 'package:popular_movie_mvvm/models/movie_model.dart';
import 'package:popular_movie_mvvm/models/movie_review_model.dart';
import 'package:popular_movie_mvvm/models/movie_search_model.dart';

class PopularMovieService {

  static const base_url = "https://api.themoviedb.org/3/";

  static Future<MovieModel> getPopularMovie(page) async {
    Map<String, dynamic> headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NGJmY2UyYTA5ZDUzMjRiNTM2OGJlNDI4YzAxM2U3OCIsInN1YiI6IjU3MWVkODEyOTI1MTQxMDUyYzAwMGM5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tgShMwJ0gg8KU5m8j06QB3a04Ezuqn1Pq7G2NhaguiI'
    };

    var response = await Dio().get('$base_url/movie/popular?page=$page', options: Options(
      headers: headers
    ));

    // print(response.data);

    return MovieModel.fromJson(response.data);
  }

  static Future<MovieCategoryModel> getGenres() async {
    Map<String, dynamic> headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NGJmY2UyYTA5ZDUzMjRiNTM2OGJlNDI4YzAxM2U3OCIsInN1YiI6IjU3MWVkODEyOTI1MTQxMDUyYzAwMGM5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tgShMwJ0gg8KU5m8j06QB3a04Ezuqn1Pq7G2NhaguiI'
    };

    var response = await Dio().get('$base_url/genre/movie/list?language=en', options: Options(
        headers: headers
    ));

    // print(response.data);

    return MovieCategoryModel.fromJson(response.data);
  }

  static Future<MovieDetailModel> getMovieDetail(movieId) async {
    Map<String, dynamic> headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NGJmY2UyYTA5ZDUzMjRiNTM2OGJlNDI4YzAxM2U3OCIsInN1YiI6IjU3MWVkODEyOTI1MTQxMDUyYzAwMGM5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tgShMwJ0gg8KU5m8j06QB3a04Ezuqn1Pq7G2NhaguiI'
    };

    var response = await Dio().get('$base_url/movie/$movieId?language=en-US', options: Options(
        headers: headers
    ));

    // print(response.data);

    return MovieDetailModel.fromJson(response.data);
  }

  static Future<MovieReviewModel> getMovieReview(movieId) async {
    Map<String, dynamic> headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NGJmY2UyYTA5ZDUzMjRiNTM2OGJlNDI4YzAxM2U3OCIsInN1YiI6IjU3MWVkODEyOTI1MTQxMDUyYzAwMGM5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tgShMwJ0gg8KU5m8j06QB3a04Ezuqn1Pq7G2NhaguiI'
    };

    var response = await Dio().get('$base_url/movie/$movieId/reviews?language=en-US&page=1', options: Options(
        headers: headers
    ));

    // print(response.data);

    return MovieReviewModel.fromJson(response.data);
  }

  static Future<MovieSearchModel> searchMovie(String movieName) async {
    Map<String, dynamic> headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NGJmY2UyYTA5ZDUzMjRiNTM2OGJlNDI4YzAxM2U3OCIsInN1YiI6IjU3MWVkODEyOTI1MTQxMDUyYzAwMGM5OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tgShMwJ0gg8KU5m8j06QB3a04Ezuqn1Pq7G2NhaguiI'
    };

    var response = await Dio().get('$base_url/search/movie?query=$movieName&include_adult=true&language=en-US&page=1', options: Options(
        headers: headers
    ));

    print(response.data);

    return MovieSearchModel.fromJson(response.data);
  }

}