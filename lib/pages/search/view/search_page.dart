import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/components/pm_text.dart';
import 'package:popular_movie_mvvm/pages/detail/view/detail_view.dart';
import 'package:popular_movie_mvvm/pages/search/view_model/search_viewmodel.dart';
import 'package:popular_movie_mvvm/utils.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchViewModel>(
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(height: Utils.kStatusBarHeight(context),),
            Card(
              margin: EdgeInsets.all(20),
              elevation: 0,
              color: Colors.white10,
              child: SizedBox(
                height: 60,
                width: Utils.kWidth(context),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        viewModel.resetMovie();
                        Utils.navigateBack(context);
                      },
                      icon: Icon(EvaIcons.arrowBack, color: Colors.white,)
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextFormField(
                        autofocus: true,
                        onFieldSubmitted: (newText) {
                          viewModel.searchMovies();
                        },
                        controller: viewModel.teSearchController,
                        style: TextStyle(
                          color: Colors.white
                        ),
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.white30,
                          ),
                          hintText: 'Seach movie name...',
                          border: InputBorder.none
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: _ui(context, viewModel)
            )
          ],
        ),
      ),
    );
  }

  _ui(BuildContext context, SearchViewModel viewModel) {
    if (viewModel.error) {
      return Center(
        child: Icon(EvaIcons.wifiOff),
      );
    }

    if (viewModel.loading) {
      return Center(
        child: CircularProgressIndicator()
      );
    }

    if (viewModel.loaded) {
      return ListView(
        padding: EdgeInsets.all(0),
        children: viewModel.listMovie.map((movie) => Card(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          color: Colors.white10,
          child: ListTile(
            onTap: () => Utils.navigatePage(context, DetailView(movieId: '${movie.id}')),
            leading: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: Utils.kWidth(context),
                  height: Utils.kHeight(context),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/gifs/image_loading.gif',
                    image: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: PmText(text: movie.title.toString(), fontWeight: FontWeight.bold,),
            subtitle: PmText(text: movie.overview.toString(), maxLines: 1,),
          ),
        ) ).toList(),
      );
    } else {
      return Center(
        child: PmText(text: 'Write Your Movie Above'),
      );
    }
  }
}
