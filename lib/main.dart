import 'package:flutter/material.dart';
import 'package:flutter_app_login/pages/auth_page.dart';
import 'package:flutter_app_login/pages/my_home.dart';
import 'package:flutter_app_login/provider/page_notifier.dart';
import 'package:provider/provider.dart';

import 'pages/auth_page.dart';
import 'pages/my_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>PageNotifier())],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Consumer<PageNotifier>(
          builder: (context,pageNotifier, child){
           return  Navigator(
              pages: [
                //맨아
                MaterialPage(
                    key: ValueKey(MyHomePage.pageName),
                    child: MyHomePage(title: 'Flutter Demo Home Page')),
                //맨위
                if (pageNotifier.currentPage == AuthPage.pageName)
                  AuthPage(),
              ],

              onPopPage: (route, result) {
                if (!route.didPop(result)) {
                  return false;
                }
                return true;
              },
            );
          },
        ),
      ),
    );
  }
}


