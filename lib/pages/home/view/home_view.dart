import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/pages/home/components/appbar_component.dart';
import 'package:popular_movie_mvvm/pages/home/components/carousel_componen.dart';
import 'package:popular_movie_mvvm/pages/home/components/error_movie.dart';
import 'package:popular_movie_mvvm/pages/home/components/movie_item_loading_component.dart';
import 'package:popular_movie_mvvm/pages/home/components/movieitem_components.dart';
import 'package:popular_movie_mvvm/pages/home/view_model/home_viewmodel.dart';
import 'package:popular_movie_mvvm/utils.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel _viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: _ui(context, _viewModel),
    );
  }

  _ui(BuildContext context, HomeViewModel homeViewModel) {
    // return Container();
    if (homeViewModel.error) {
      return ErrorMovie();
    }

    return homeViewModel.loading ? Center(child: CircularProgressIndicator(),) : Column(
      children: [
        SizedBox(height: Utils.kStatusBarHeight(context),),
        AppBarComponent(),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              homeViewModel.resetMovie();
              homeViewModel.getMovie(1);
            },
            child: ListView(
              padding: EdgeInsets.all(0),
              controller: homeViewModel.scrollController,
              children: [
                CarouselComponent(top5movies: homeViewModel.top5movies, genres: homeViewModel.genres,),
                SizedBox(height: 20,),
                ...homeViewModel.movie.map((movie) => Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Card(
                    color: Colors.white12,
                    child: MovieItemComponent(movie: movie, genres: homeViewModel.genres,),
                  ),
                )).toList(),
                MovieItemLoadingComponent(),
                SizedBox(height: 30,),
              ]
            ),
          ),
        ),
      ],
    );
  }
}
