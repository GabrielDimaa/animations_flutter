import 'package:flutter/material.dart';

class AnimationDefaultTextStyle extends StatefulWidget {
  const AnimationDefaultTextStyle({Key? key}) : super(key: key);

  @override
  State<AnimationDefaultTextStyle> createState() => _AnimationDefaultTextStyleState();
}

class _AnimationDefaultTextStyleState extends State<AnimationDefaultTextStyle> {
  List<TextStyle> styles = [
    const TextStyle(color: Colors.red, fontWeight: FontWeight.w900, fontSize: 26),
    const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500, fontSize: 24),
    const TextStyle(color: Colors.green, fontWeight: FontWeight.w700, fontSize: 22),
    const TextStyle(color: Colors.deepOrange, fontStyle: FontStyle.italic, fontSize: 30),
    const TextStyle(color: Colors.teal, fontStyle: FontStyle.italic, fontSize: 26, decoration: TextDecoration.underline),
  ];

  late TextStyle textStyle;

  @override
  void initState() {
    super.initState();
    textStyle = styles[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Default Text Style")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: AnimatedDefaultTextStyle(
                    style: textStyle,
                    curve: Curves.easeIn,
                    duration: const Duration(seconds: 1),
                    child: const Text("Text Style"),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  int index = styles.indexOf(textStyle);
                  if (index == styles.length - 1) {
                    textStyle = styles[0];
                  } else {
                    textStyle = styles[index + 1];
                  }
                }),
                child: const Text("Animar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
