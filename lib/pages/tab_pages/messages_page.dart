import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: <Widget>[
          CupertinoSliverNavigationBar(
              largeTitle: Text('Messages'),
              //middle: Text('Search',style: TextStyle(fontSize: 15.5,),)
            //middle: CupertinoTextField(),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(width: 10,),
                Icon(CupertinoIcons.create),
              ],
            ),
          ),
          CupertinoSliverRefreshControl(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index){
                  return Column(
                    children: <Widget>[
                      listItem(context),
                      Divider(height: 1, indent: 50,),
                    ],
                  );
                },
              childCount: 20,
            )
          ),
          SliverToBoxAdapter(child: SizedBox(height: 100,),)

        ],
      ),
    );
  }

  Widget listItem(BuildContext context){
    Random ran = new Random();
    int n = ran.nextInt(200);
    return Material(
        color: CupertinoTheme.of(context).primaryContrastingColor,
        child: ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: 50,
          height: 50,
          child: Image(
            image: NetworkImage('https://picsum.photos/id/$n/100/100'),
            fit: BoxFit.cover,
          ),
        )
      ),
      title: Text('Person name',),
      subtitle: Text('Last message sent'),
      trailing: Icon(CupertinoIcons.delete),
    ));
  }
}
