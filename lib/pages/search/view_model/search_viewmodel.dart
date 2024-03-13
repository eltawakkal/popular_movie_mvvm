import 'package:flutter/cupertino.dart';
import 'package:popular_movie_mvvm/models/movie_search_model.dart';
import 'package:popular_movie_mvvm/pages/search/repository/seach_repository.dart';

class SearchViewModel extends ChangeNotifier {

  TextEditingController teSearchController = TextEditingController();

  bool _isLoading = false;
  bool _isLoaded = false;
  bool _isError = false;

  late List<Results> _listMovie;

  bool get loading =>  _isLoading;
  bool get loaded => _isLoaded;
  bool get error => _isError;

  List<Results> get listMovie => _listMovie;

  setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  setLoaded(bool loaded) {
    _isLoaded = loaded;
    notifyListeners();
  }

  setError(bool error) {
    _isError = error;
    notifyListeners();
  }

  resetMovie() {
    _listMovie = [];
    setLoaded(false);
    teSearchController.text = '';
  }

  setMovie(MovieSearchModel model) {
    _listMovie = model.results!;
    setLoaded(true);
  }

  searchMovies() async {
    setLoading(true);

    var response = await SearchRepository.searchMovie(teSearchController.text);
    setMovie(response);

    setLoading(false);
  }

}