import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/components/pm_text.dart';
import 'package:popular_movie_mvvm/pages/detail/view_model/detail_viewmodel.dart';
import 'package:popular_movie_mvvm/utils.dart';
import 'package:provider/provider.dart';

class AppBarComponent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailViewModel>(
      builder: (context, viewModel, child) => Container(
        height: 56,
        child: Row(
          children: [
            SizedBox(width: 5,),
            IconButton(
                onPressed: () => Utils.navigateBack(context),
                icon: Icon(EvaIcons.arrowBack, color: Colors.white,)
            ),
            Spacer(),
            PmText(text: 'Movie Detail', fontSize: 18, fontWeight: FontWeight.bold,),
            Spacer(),
            IconButton(
                onPressed: () => viewModel.addToFavorite(context, 1, 'wooow', 'ahasdfsdf'),
                icon: Icon(EvaIcons.heart, color: Colors.red,)
            ),
            SizedBox(width: 5,)
          ],
        ),
      )
    );
  }
}
