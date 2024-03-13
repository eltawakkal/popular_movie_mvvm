import 'package:carousel_slider/carousel_slider.dart';
import 'package:country_flags/country_flags.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/components/pm_text.dart';
import 'package:popular_movie_mvvm/models/movie_category_model.dart';
import 'package:popular_movie_mvvm/models/movie_model.dart';
import 'package:popular_movie_mvvm/pages/detail/view/detail_view.dart';
import 'package:popular_movie_mvvm/utils.dart';

class CarouselComponent extends StatelessWidget {

  final List<Results> top5movies;
  final List<Genres> genres;

  const CarouselComponent({super.key, required this.top5movies, required this.genres});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        enlargeCenterPage: true,
        enlargeFactor: 0.5,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        viewportFraction: 0.9,
      ),
      items: top5movies.map((movie) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () => Utils.navigatePage(context, DetailView(movieId: '${movie.id}',)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white24
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: Utils.kHeight(context),
                        width: Utils.kWidth(context),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/gifs/image_loading.gif',
                          image: 'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: Utils.kWidth(context),
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.black
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter
                            ),
                          )
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Card(
                              child: SizedBox(
                                height: 80,
                                width: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/gifs/image_loading.gif',
                                    image: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PmText(text: '${movie.title}', fontSize: 16, fontWeight: FontWeight.bold, maxLines: 2,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CountryFlag.fromLanguageCode(
                                      '${movie.originalLanguage}',
                                      height: 15,
                                      width: 15,
                                    ),
                                    SizedBox(width: 10,),
                                    Icon(EvaIcons.star, color: Colors.yellow, size: 15,),
                                    PmText(text: '${movie.voteAverage}'),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
