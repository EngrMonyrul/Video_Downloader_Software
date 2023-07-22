import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/likeAndDislike.dart';

class likeAndDislike extends StatefulWidget {
  const likeAndDislike({super.key});

  @override
  State<likeAndDislike> createState() => _likeAndDislikeState();
}

class _likeAndDislikeState extends State<likeAndDislike> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: [
          const Center(
            child: Text(
              'Do You Like This App?!',
              style: TextStyle(
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer<LikeDislikeProvider>(
            builder: (context, value, child) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        value.setLiked();
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Icon(
                            value.liked
                                ? Icons.thumb_up
                                : Icons.thumb_up_outlined,
                          ),
                          Text(
                            value.likeCount.toString(),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        value.setDislike();
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Icon(
                            value.liked
                                ? Icons.thumb_down_outlined
                                : Icons.thumb_down,
                          ),
                          Text(
                            value.dislikeCount.toString(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
