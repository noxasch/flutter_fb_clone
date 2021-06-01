import 'package:flutter/material.dart';
import 'package:marcus_ng_fbclone/widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../config/pallete.dart';
import '../models/user_model.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final void Function(int index) onTap;

  const CustomAppBar({Key key, 
    @required this.currentUser, 
    @required this.icons, 
    @required this.selectedIndex, 
    @required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4.0
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text('facebook',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2
              ),
            ),
          ),
          Container(
            // height: double.infinity,
            width: 600.0,
            child: CustomTabBar(
              icons: icons, onTap: onTap, selectedIndex: selectedIndex, isBottomIndicator: true
            )
          ),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserCard(user: currentUser),
              const SizedBox(width: 12.0,),
              CircleButton(icon: Icons.search, iconSize: 30.0, onPressed: () {}),
              CircleButton(icon: MdiIcons.facebookMessenger, iconSize: 30.0, onPressed: () {}),
            ],
          ))
        ],
      ),
    );
  }
}