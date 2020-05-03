import 'package:fiber/UI/Style.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  static const routeName = '/profile';
  @override
  State<StatefulWidget> createState() {
    return _ProfileViewState();
  }
}

class _ProfileViewState extends State<ProfileView> {
  @override
  TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          Text(
            '{{Name from auth}}}}',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                dense: true,
                title: Text(
                  'Add Skills to Tower of Folls Maybe?',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Style.tabsColor,
                      fontSize: 14.0),
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                onTap: () {},
                dense: true,
                title: Text(
                  'Some Other Feature',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Style.tabsColor,
                      fontSize: 14.0),
                ),
              ),
              Divider(),
              ListTile(
                dense: true,
                title: Text(
                  'Some Other Feature',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Style.tabsColor,
                      fontSize: 14.0),
                ),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                onTap: () {},
                dense: true,
                title: Text(
                  'Logout',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Style.tabsColor,
                      fontSize: 14.0),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
