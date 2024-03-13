import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/components/pm_text.dart';

class CategoryComponent extends StatelessWidget {

  final String text;

  const CategoryComponent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 7, right: 7, top: 3, bottom: 3),
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white10,
      ),
      child: PmText(text: text, color: Colors.red, fontSize: 12,),
      // child: PmText(text: genres.where((element) => element.id == item.value).first.name! + (item.key < movie.genreIds!.length -1 ? ', ' : '') , color: Colors.red,),
    );
  }
}
