import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/components/pm_text.dart';
import 'package:popular_movie_mvvm/pages/preview/view/preview_image.dart';
import 'package:popular_movie_mvvm/utils.dart';

class BottomSheetComponent extends StatelessWidget {

  final String person;
  final String createdAt;
  final String review;
  final String? avatarUrl;

  const BottomSheetComponent({super.key, required this.person, required this.review, this.avatarUrl, required this.createdAt});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      padding: EdgeInsets.all(30),
      width: Utils.kWidth(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: InkWell(
                  onTap: () => Utils.navigatePage(context, PreviewImage(imgUrl: 'https://image.tmdb.org/t/p/w500/$avatarUrl')),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/gifs/image_loading.gif',
                      image: 'https://image.tmdb.org/t/p/w500/$avatarUrl',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PmText(text: person, fontWeight: FontWeight.bold,),
                  PmText(text: Utils.dateToReadable(createdAt))
                ],
              )
            ],
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Stack(
                children: [
                  ListView(
                    children: [
                      SizedBox(height: 20,),
                      PmText(text: review, maxLines: 100,),
                    ],
                  ),
                  Positioned(
                    child: Container(
                      height: 30,
                      width: Utils.kWidth(context),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              // stops: [0, 0.2],
                              colors: [
                                Colors.black,
                                Colors.transparent
                              ]
                          )
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 30,
                      width: Utils.kWidth(context),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              // stops: [0, 0.2],
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ]
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
