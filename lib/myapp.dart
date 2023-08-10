import 'package:flutter/material.dart';
import 'package:not_amazon/presentation/animations/page_transition_animation.dart';
import 'package:not_amazon/presentation/home_page.dart';
import 'package:not_amazon/presentation/routes/routes.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      title: 'Not Amazon',
      theme: ThemeData(useMaterial3: true,
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CustomPageTransitionsBuilder(),
          TargetPlatform.iOS: CustomPageTransitionsBuilder()
        }
      )),
      onGenerateRoute: (settings) => _appRouter.onGenerateRoute(settings),
    );
  }
}