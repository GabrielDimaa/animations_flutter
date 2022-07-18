import 'package:flutter/material.dart';

import 'animations/animation_align.dart';
import 'animations/animation_builder.dart';
import 'animations/animation_container.dart';
import 'animations/animation_cross_fade.dart';
import 'animations/animation_default_text_style.dart';
import 'animations/animation_list_state.dart';
import 'home_page.dart';

class AppTheme extends StatefulWidget {
  const AppTheme({Key? key}) : super(key: key);

  @override
  State<AppTheme> createState() => _AppThemeState();
}

class _AppThemeState extends State<AppTheme> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Animations",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: _colorScheme),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const HomePage(),
        '/animation_align': (_) => const AnimationAlign(),
        '/animation_builder': (_) => const AnimationBuilder(),
        '/animation_container': (_) => const AnimationContainer(),
        '/animation_cross_fade': (_) => const AnimationCrossFade(),
        '/animation_default_text_style': (_) => const AnimationDefaultTextStyle(),
        '/animation_list_state': (_) => const AnimationListState(),
      },
    );
  }

  ColorScheme get _colorScheme => const ColorScheme.light(
        brightness: Brightness.light,
        primary: Color(0xFF592E83),
        onPrimary: Colors.white,
      );
}
