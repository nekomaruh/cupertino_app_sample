import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool _showActivityIndicator = false;
  bool _switch = false;
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Widgets'),
      ),
      child: SafeArea(child: Material(
        color: CupertinoTheme.of(context).primaryContrastingColor,
        child: Scrollbar(
          controller: ScrollController(),
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.view_stream),
                title: Text('Action sheet'),
                subtitle: Text('Displays a bottom view'),
                onTap: (){
                  showCupertinoModalPopup(context: context, builder: (BuildContext context) => CupertinoActionSheet(
                    title: Text('Title'),
                    message: Text('Message'),
                    actions: <Widget>[
                      CupertinoActionSheetAction(child: Text('Action 1'), onPressed: (){},),
                      CupertinoActionSheetAction(child: Text('Action 2'), onPressed: (){},),
                    ],
                    cancelButton: CupertinoActionSheetAction(
                      child: const Text('Cancel'),
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context, 'Cancel');
                      },
                    ),
                  ),);
                },
              ),

              ListTile(
                leading: Icon(Icons.update),
                title: Text('Activity indicator'),
                subtitle: Text('Displays a loading gif'),
                trailing: _showActivityIndicator ? CupertinoActivityIndicator() : SizedBox(),
                onTap: (){
                  setState(() {
                    _showActivityIndicator ? _showActivityIndicator = false : _showActivityIndicator = true;
                  });
                },
              ),

              ListTile(
                leading: Icon(Icons.notifications_active),
                title: Text('Alert dialog'),
                subtitle: Text('Displays an alert dialog'),
                onTap: (){
                  showCupertinoModalPopup(context: context, builder: (_) => CupertinoAlertDialog(
                    title: Text('Title'),
                    content: Text('Content'),
                    actions: <Widget>[
                      CupertinoButton(
                        child: Text('Cancel'),
                        onPressed: (){Navigator.pop(context, 'Cancel');},
                      )
                    ],
                  ));
                },
              ),


              ListTile(
                leading: Icon(Icons.menu),
                title: Text('Context menu'),
                subtitle: Text('Displays a pop-up menu'),
                onTap: (){
                  showCupertinoModalPopup(context: context, builder: (_) => CupertinoContextMenu(
                    actions: <Widget>[
                      CupertinoContextMenuAction(
                        child: Text('Action 1'),
                      ),
                      CupertinoContextMenuAction(
                        child: Text('Action 2'),
                      )
                    ],
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(width: 200, height: 100, color: Colors.white, child: Center(child: Text('Long press'),),)),
                  ),
                  );
                },
              ),


              ListTile(
                leading: Icon(Icons.date_range),
                title: Text('Date picker'),
                subtitle: Text('Displays a date picker'),
                onTap: (){
                  showModalBottomSheet(context: context, builder: (_) => CupertinoDatePicker(
                    onDateTimeChanged: (date){},
                  ));
                },
              ),
              ListTile(
                leading: Icon(Icons.add_to_home_screen),
                title: Text('Dialog'),
                subtitle: Text('Displays a dialog'),
              ),
              ListTile(
                leading: Icon(Icons.fullscreen),
                title: Text('Full screen dialog transition'),
                subtitle: Text('Displays a dialog transition'),
              ),
              ListTile(
                leading: Icon(Icons.pageview),
                title: Text('Page transition'),
                subtitle: Text('Displays an animation transition'),
              ),
              ListTile(
                leading: Icon(Icons.calendar_view_day),
                title: Text('Picker'),
                subtitle: Text('Displays a bottom sheet'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: CupertinoButton(
                  child: Text('Button'),
                  color: CupertinoTheme.of(context).primaryColor,
                  onPressed: (){},
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: <Widget>[
                    Text('Slider'),
                    SizedBox(width: 10,),
                    Expanded(
                      child: CupertinoSlider(
                        onChanged: (value){
                          setState(() {
                            _sliderValue = value;
                          });
                        },
                        min: 0,
                        max: 100,
                        value: _sliderValue,
                      ),
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('Switch'),
                    Expanded(child: SizedBox(),),
                    CupertinoSwitch(
                      onChanged: (value){ setState(() {
                        _switch = value;
                      });},
                      value: _switch,
                    ),
                  ],
                ),
              )
              /*
              CupertinoSegmentedControl(
                onValueChanged: (value){},
                children: [],
              ),

               */

            ],
          ),
        ),
      )),
    );
  }
}
