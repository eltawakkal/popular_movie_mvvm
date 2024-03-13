import 'package:country_flags/country_flags.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:popular_movie_mvvm/components/pm_text.dart';
import 'package:popular_movie_mvvm/models/movie_category_model.dart';
import 'package:popular_movie_mvvm/models/movie_model.dart';
import 'package:popular_movie_mvvm/pages/detail/view/detail_view.dart';
import 'package:popular_movie_mvvm/pages/home/components/category_component.dart';
import 'package:popular_movie_mvvm/utils.dart';

class MovieItemComponent extends StatelessWidget {

  final Results movie;
  final List<Genres> genres;

  const MovieItemComponent({super.key, required this.movie, required this.genres});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Utils.navigatePage(context, DetailView(movieId: '${movie.id}',)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                // child: Image.asset('assets/images/gifs/image_loading.gif'),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/gifs/image_loading.gif',
                  image: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PmText(text: '${movie.title}', fontWeight: FontWeight.bold, fontSize: 16,),
                  SizedBox(height: 5,),
                  SizedBox(
                    height: 25,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: movie.genreIds!.asMap().entries.map((item) => CategoryComponent(
                        text: genres.where((element) => element.id == item.value).first.name!)
                      ).toList(),
                    ),
                  ),
                  SizedBox(height: 5,),
                  PmText(text: '${movie.overview}', fontSize: 14,),
                  SizedBox(height: 5,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CountryFlag.fromLanguageCode(
                        '${movie.originalLanguage}',
                        height: 15,
                        width: 15,
                      ),
                      SizedBox(width: 10,),
                      Icon(EvaIcons.star, color: Colors.yellow, size: 15,),
                      PmText(text: '${movie.voteAverage}'),
                      Spacer(),
                      PmText(text: '${movie.releaseDate}', color: Colors.white54,),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
