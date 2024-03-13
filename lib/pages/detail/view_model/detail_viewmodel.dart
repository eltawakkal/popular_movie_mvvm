import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/components/pm_text.dart';
import 'package:popular_movie_mvvm/models/movie_detail_model.dart';
import 'package:popular_movie_mvvm/models/movie_review_model.dart';
import 'package:popular_movie_mvvm/pages/detail/components/bottom_sheet_component.dart';
import 'package:popular_movie_mvvm/pages/detail/components/fav_snackbar_component.dart';
import 'package:popular_movie_mvvm/pages/detail/repository/detail_repository.dart';

class DetailViewModel with ChangeNotifier {

  bool _isLoading = true;
  bool _isError = false;
  String _errorMsg = "";

  late MovieDetailModel _movieDetailModel;
  late MovieReviewModel _movieReviewModel;

  bool get isLoading => _isLoading;
  bool get isError => _isError;
  String get errorMsg => _errorMsg;

  MovieDetailModel get movieDetailModel => _movieDetailModel;
  MovieReviewModel get movieReviewModel => _movieReviewModel;

  setError(bool status) {
    _isError = status;
    notifyListeners();
  }

  setErrorMsg(String msg) {
    _errorMsg = msg;
  }

  setLoading(bool status) {
    _isLoading = status;
    notifyListeners();
  }

  setMovieDetail(MovieDetailModel movieDetailModel) => _movieDetailModel = movieDetailModel;
  setMovieReview(MovieReviewModel movieReviewModel) => _movieReviewModel = movieReviewModel;

  getMovieDetail(movieId) async {
    setLoading(true);

    // try {
     var response = await DetailRepository.getMovieDetail(movieId);
     setMovieDetail(response);
    // } catch (e) {
    //   setErrorMsg(e.toString());
    //   setError(true);
    // }

    // setLoading(false);
    getMovieReview(movieId);
  }

  getMovieReview(movieId) async {
    // try {
      var response = await DetailRepository.getMovieReview(movieId);
      setMovieReview(response);
    // } catch (e) {
    //   print(e.toString());
    //   setError(true);
    // }
    setLoading(false);
  }

  showDetailComment(context, person, createdAt, review, avatarUrl) {
    showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetComponent(
        person: person,
        createdAt: createdAt,
        review: review,
        avatarUrl: '$avatarUrl',
      )
    );
  }

  addToFavorite(context, movieId, movieTitle, movieOverview) {
    DetailRepository.addToFavorite(movieId, movieTitle, movieOverview);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: PmText(text: 'Movie Added To Favorite',)));
  }

}