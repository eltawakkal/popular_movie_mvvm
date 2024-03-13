import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/components/pm_text.dart';
import 'package:popular_movie_mvvm/pages/search/view/search_page.dart';
import 'package:popular_movie_mvvm/utils.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network('https://img.freepik.com/free-vector/flat-design-portrait-with-abstract-shapes_23-2149133364.jpg?size=338&ext=jpg&ga=GA1.1.1700460183.1708041600&semt=ais', fit: BoxFit.cover,)
            ),
          ),
          SizedBox(width: 20,),
          PmText(text: 'POPULAR MOVIE', fontWeight: FontWeight.bold, fontSize: 18,),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(EvaIcons.heart, color: Colors.white,),
          ),
          IconButton(
            onPressed: () => Utils.navigatePage(context, SearchPage()),
            icon: Icon(EvaIcons.search, color: Colors.white,),
          )
        ],
      ),
    );
  }
}
