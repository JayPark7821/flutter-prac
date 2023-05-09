import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({
    super.key,
  });

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 이미지
        Image.network(
          "https://i.ibb.co/YjjLCS7/cat.png",
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(CupertinoIcons.heart, color: isLiked ? Colors.pink :Colors.black),
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
            ),
            IconButton(
              icon: Icon(CupertinoIcons.chat_bubble, color: Colors.black),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(CupertinoIcons.bookmark, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "2 likes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("My cat is docile"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "FEB 6",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}