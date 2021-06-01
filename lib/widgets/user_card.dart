import 'package:flutter/material.dart';
import 'package:marcus_ng_fbclone/widgets/profile_avatar.dart';
import '../models/user_model.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    Key key, 
    @required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(width: 6.0,),
          Flexible( // to avoid renderflow error if name too long
            child: Text(
              user.name,
              style: const TextStyle(fontSize: 16.0),
              // to avoid renderflow error if name too long
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}