import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/components/pm_text.dart';
import 'package:popular_movie_mvvm/pages/detail/view_model/detail_viewmodel.dart';
import 'package:popular_movie_mvvm/pages/preview/view/preview_image.dart';
import 'package:popular_movie_mvvm/utils.dart';
import 'package:provider/provider.dart';

class CommentComponent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailViewModel>(
      builder: (context, viewModel, child) => Column(
        children: viewModel.movieReviewModel.results!.map((movie) => Card(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          color: Colors.white10,
          child: ListTile(
            onTap: () => viewModel.showDetailComment(context, movie.author, movie.createdAt, movie.content, movie.authorDetails!.avatarPath),
            leading: SizedBox(
              height: 50, width: 50,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: InkWell(
                    onTap: () => Utils.navigatePage(context, PreviewImage(imgUrl: 'https://image.tmdb.org/t/p/w500${movie.authorDetails!.avatarPath}')),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/gifs/image_loading.gif',
                      image: movie.authorDetails!.avatarPath != null ? 'https://image.tmdb.org/t/p/w500/${movie.authorDetails!.avatarPath}' : 'https://www.businessnetworks.com/sites/default/files/default_images/default-avatar.png',
                      fit: BoxFit.cover,
                    ),
                  )
              ),
            ),
            title: Row(
              children: [
                PmText(text: movie.author.toString(), fontWeight: FontWeight.bold,),
                Spacer(),
                PmText(text: Utils.dateToReadable(movie.createdAt.toString()), maxLines: 2,),
              ],
            ),
            subtitle: PmText(text: movie.content.toString(), maxLines: 2,),
          )
        )).toList(),
      ),
    );
  }
}
