import 'package:flutter/material.dart';
import 'package:myapp/core/store.dart';
import 'package:myapp/pages/cart_page.dart';
import 'package:myapp/pages/home_detail_page.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/login_page.dart';

import 'package:myapp/utlx/routes.dart';
import 'package:myapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/": (_, __) => MaterialPage(child: const HomePage()),
        MyRoute.homeRoute: (_, __) => MaterialPage(child: const HomePage()),
        MyRoute.homeDetailsRoute: (uri, _) {
          final catalog = (VxState.store as MyStore)
              .catalog
              .getById(int.parse(uri.queryParameters["id"].toString()));
          return MaterialPage(
              child: HomeDetailPage(
            catalog: catalog,
          ));
        },
        MyRoute.loginRoute: (_, __) => MaterialPage(child: const LoginPage()),
        MyRoute.cartRoute: (_, __) => MaterialPage(child: const CartPage()),
      }),
      // initialRoute: MyRoute.homeRoute,
      // routes: {
      //   // "/": (context) => const LoginPage(),
      //   MyRoute.homeRoute: (context) => const HomePage(),
      //   MyRoute.loginRoute: (context) => const LoginPage(),
      //   MyRoute.cartRoute: (context) => const CartPage(),
      // },
    );
  }
}
