import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:marcus_ng_fbclone/widgets/widgets.dart';
import '../models/models.dart';
import '../config/pallete.dart';

class Room extends StatelessWidget {
  final List<User> onlineUsers;

  const Room({Key key, @required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      clipBehavior: Clip.antiAlias, // to make it work on desktop
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ) : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index-1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,),
              child: ProfileAvatar(imageUrl: user.imageUrl, isActive: true,),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Colors.white,
          side: BorderSide(width: 3.0, color: Colors.blueAccent[100]),
          textStyle: TextStyle(color: Palette.facebookBlue)),
      child: Row(
        children: [
          // doesn't work on web
          // ShaderMask(
          //   // use gradient color
          //   shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
          //   child: Icon(
          //     Icons.video_call,
          //     size: 35.0,
          //     color: Colors.white,
          //   ),
          // ),
          Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.purple,
          ),
          const SizedBox(width: 4.0,),
          Text('Create\nRoom')
        ],
      ),
      onPressed: () {},
    );
  }
}
