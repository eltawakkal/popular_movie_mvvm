import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class LocalFavMovieModel {

  @HiveField(0)
  String movieId;
  @HiveField(1)
  String movieTitle;

  LocalFavMovieModel({required this.movieId, required this.movieTitle});

}