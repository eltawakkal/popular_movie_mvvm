import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/models/movie_category_model.dart';
import 'package:popular_movie_mvvm/models/movie_model.dart';
import 'package:popular_movie_mvvm/pages/home/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {

  HomeViewModel() {
    getGenres();
    addScrollListener();
  }

  final _scrollController = ScrollController();

  int moviePage = 1;

  bool _loading = false;
  bool _error = false;
  List<Results> _movies = [];
  List<Results> _top5movies = [];
  List<Genres> _genres = [];

  ScrollController get scrollController => _scrollController;
  bool get loading => _loading;
  bool get error => _error;
  List<Results> get movie => _movies;
  List<Results> get top5movies => _top5movies;
  List<Genres> get genres => _genres;

  addScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > _scrollController.position.maxScrollExtent - 300) {
        if(!loading) {
          moviePage++;
          getMovie(moviePage);
        }
      }
    });
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setError(bool error) async {
    _error = error;
    notifyListeners();
  }

  setGenres(List<Genres> genres) {
    _genres = genres;
  }

  resetMovie() {
    _movies = [];
  }

  setMovie(MovieModel movieModel) {
    var results = movieModel.results;
    for (var i=0; i<5; i++) {
      _top5movies.add(results![i]);
      results.removeAt(i);
    }
    _movies.addAll(movieModel.results!);
  }

  getGenres() async {
    setLoading(true);
    var response = await HomeRepository.getGenres();
    setGenres(response.genres!);

    getMovie(moviePage);
  }

  getMovie(page) async {
    var response = await HomeRepository.getPopularMovie(page);
    if (response.results != null) {
      setMovie(response);
    } else {
      setError(true);
    }
    setLoading(false);
  }

}