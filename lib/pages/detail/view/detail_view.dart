import 'package:country_flags/country_flags.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/components/pm_text.dart';
import 'package:popular_movie_mvvm/pages/detail/components/appbar_coponent.dart';
import 'package:popular_movie_mvvm/pages/detail/components/reviews_component.dart';
import 'package:popular_movie_mvvm/pages/detail/view_model/detail_viewmodel.dart';
import 'package:popular_movie_mvvm/pages/home/components/category_component.dart';
import 'package:popular_movie_mvvm/pages/preview/view/preview_image.dart';
import 'package:popular_movie_mvvm/utils.dart';
import 'package:provider/provider.dart';

class DetailView extends StatelessWidget {

  final String movieId;

  const DetailView({super.key, required this.movieId});
  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DetailViewModel>(context, listen: false).getMovieDetail(movieId);
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<DetailViewModel>(
        builder: (context, viewModel, child) => _ui(context, viewModel)
      )
    );
  }

  _ui(BuildContext context, DetailViewModel viewModel) {
    if (viewModel.isError) {
      return Center(
        child: Icon(EvaIcons.wifiOff, size: 32, color: Colors.white,),
      );
    }

    return viewModel.isLoading ? Center(child: CircularProgressIndicator(),) : Column(
      children: [
        SizedBox(height: Utils.kStatusBarHeight(context),),
        AppBarComponent(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  Column(
                    children: [
                      Container(
                        width: Utils.kWidth(context),
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white12
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            onTap: () => Utils.navigatePage(context, PreviewImage(imgUrl: 'https://image.tmdb.org/t/p/w500${viewModel.movieDetailModel.backdropPath}')),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/images/gifs/image_loading.gif',
                              image: 'https://image.tmdb.org/t/p/w500${viewModel.movieDetailModel.backdropPath}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 75,)
                    ],
                  ),
                  Positioned(
                    left: 20,
                    bottom: 0,
                    right: 0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Card(
                          child: SizedBox(
                            height: 150,
                            width: 110,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                onTap: () => Utils.navigatePage(context, PreviewImage(imgUrl: 'https://image.tmdb.org/t/p/w500${viewModel.movieDetailModel.posterPath}')),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/gifs/image_loading.gif',
                                  image: 'https://image.tmdb.org/t/p/w500${viewModel.movieDetailModel.posterPath}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: PmText(text: '${viewModel.movieDetailModel.title}', fontSize: 18, fontWeight: FontWeight.bold,),
                        ))
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 30,),
              Container(
                width: Utils.kWidth(context),
                height: 60,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Icon(EvaIcons.star, color: Colors.yellow, size: 18,),
                    SizedBox(width: 5,),
                    PmText(text: '${viewModel.movieDetailModel.voteAverage}', fontSize: 14,),
                    Spacer(),
                    VerticalDivider(
                      color: Colors.white24,
                    ),
                    Spacer(),
                    CountryFlag.fromLanguageCode(
                      '${viewModel.movieDetailModel.originalLanguage}',
                      height: 20,
                      width: 20,
                    ),
                    Spacer(),
                    VerticalDivider(
                      color: Colors.white24,
                    ),
                    Spacer(),
                    // Icon(EvaIcons.calendar),
                    PmText(text: '${viewModel.movieDetailModel.releaseDate}', fontSize: 15,),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 25,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: viewModel.movieDetailModel.genres!.map((genre) => CategoryComponent(text: genre.name!)).toList(),
                ),
              ),
              SizedBox(height: 20,),
              PmText(text: 'Overview', fontWeight: FontWeight.bold, fontSize: 16,),
              PmText(text: '${viewModel.movieDetailModel.overview}', maxLines: 200, fontSize: 14,),
              SizedBox(height: 20,),
              PmText(text: 'Reviews', fontWeight: FontWeight.bold, fontSize: 16,),
              viewModel.movieReviewModel.results!.length > 0 ? CommentComponent() : Center(child: PmText(text: 'No Reviews Yet.'),)
            ],
          ),
        )
      ],
    );
  }
}
