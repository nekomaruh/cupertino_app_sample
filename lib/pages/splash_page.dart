import 'package:flutter/cupertino.dart';

import 'home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Pantalla de bienvenida'),
          SizedBox(height: 20,),
          CupertinoButton(
            child: Text('Continuar'),
            color: CupertinoTheme.of(context).primaryColor,
            onPressed: (){

              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_) => HomePage()));

              /*
              Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) => HomePage()),
              );

               */
            },
          )
        ],
      )),

    );
  }
}
