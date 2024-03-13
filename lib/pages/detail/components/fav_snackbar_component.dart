import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/components/pm_text.dart';

class FavSnackBarComponent extends StatelessWidget {

  final String text;

  const FavSnackBarComponent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: PmText(text: text));
  }
}
