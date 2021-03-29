import 'package:flutter/material.dart';
import 'package:flutter_app_login/provider/page_notifier.dart';
import 'package:provider/provider.dart';

class AuthPage extends Page{

  static final pageName = 'AuthPage';

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this, builder: (context)=>AuthWidget());
  }

}

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Provider.of<PageNotifier>(context, listen: false).goToMain();
        },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                  image: AssetImage('assets/image.gif')
              )
            ),
          ),
      ),
    );
  }
}
