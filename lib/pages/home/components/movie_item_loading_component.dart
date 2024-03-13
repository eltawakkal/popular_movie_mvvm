import 'package:flutter/material.dart';
import 'package:popular_movie_mvvm/utils.dart';
import 'package:shimmer/shimmer.dart';

class MovieItemLoadingComponent extends StatelessWidget {
  const MovieItemLoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 15, right: 15),
      color: Colors.white12,
      child: SizedBox(
        width: Utils.kWidth(context),
        child: Shimmer.fromColors(
          baseColor: Colors.white30,
          highlightColor: Colors.white54,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white10
                  ),
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 15,
                        width: Utils.kWidth(context) / 4,
                        color: Colors.white10,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 20),
                            height: 15,
                            width: 60,
                            color: Colors.white10,
                          ),
                          SizedBox(width: 10,),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 20),
                            height: 15,
                            width: 40,
                            color: Colors.white10,
                          ),
                          SizedBox(width: 10,),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 20),
                            height: 15,
                            width: 70,
                            color: Colors.white10,
                          ),
                        ],
                      ),
                      Container(
                        height: 40,
                        width: Utils.kWidth(context),
                        color: Colors.white10,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 20),
                            height: 15,
                            width: 60,
                            color: Colors.white10,
                          ),
                          SizedBox(width: 10,),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 20),
                            height: 15,
                            width: 70,
                            color: Colors.white10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
