import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text('Settings'),
            //middle: Text('Search',style: TextStyle(fontSize: 15.5,),)
            //middle: CupertinoTextField(),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  child: Icon(CupertinoIcons.profile_circled, size: 30,),
                  backgroundColor: Colors.transparent,
                )
                //Icon(CupertinoIcons.create),
              ],
            ),
          ),
          CupertinoSliverRefreshControl(),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Material(
                  color: CupertinoTheme.of(context).primaryContrastingColor,
                  child: SwitchListTile.adaptive(
                    value: darkMode,
                    onChanged: (value) {
                      setState(() {
                        darkMode = value;
                        CupertinoThemeData(
                          brightness: Brightness.dark
                        );
                      });
                    },
                    title: Text("Dark Mode"),
                  ));
            },
            childCount: 1,
          ))
        ],
      ),
    );
  }
}
