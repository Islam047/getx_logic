import 'package:flutter/material.dart';

import '../models/Post.dart';
class PostCardView extends StatelessWidget {
  final Post post;
  const PostCardView({Key? key,required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: ListTile(
        title: Text(post.title,maxLines: 1,overflow: TextOverflow.ellipsis,),
        subtitle: Text(post.body,maxLines: 2,overflow: TextOverflow.ellipsis,),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(

              onPressed: () {},
              icon: const Icon(Icons.delete_outline),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
