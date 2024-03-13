import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/components/pm_text.dart';
import 'package:popular_movie_mvvm/utils.dart';

class PreviewImage extends StatelessWidget {

  final String imgUrl;

  const PreviewImage({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Utils.navigateBack(context),
          icon: Icon(EvaIcons.arrowBack, color: Colors.white,),
        ),
        centerTitle: true,
        title: PmText(text: 'Preview Image', fontSize: 20, fontWeight: FontWeight.bold,),
      ),
      body: Center(
        child: InteractiveViewer(
          scaleEnabled: true,
          child: SizedBox(
            width: Utils.kWidth(context),
            height: Utils.kHeight(context),
            child: Image.network(imgUrl)
          ),
        ),
      ),
    );
  }
}
