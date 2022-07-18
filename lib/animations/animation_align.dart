import 'package:flutter/material.dart';

class AnimationAlign extends StatefulWidget {
  const AnimationAlign({Key? key}) : super(key: key);

  @override
  State<AnimationAlign> createState() => _AnimationAlignState();
}

class _AnimationAlignState extends State<AnimationAlign> {
  Alignment alignment = Alignment.topLeft;

  List<Alignment> alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.centerRight,
    Alignment.centerLeft,
    Alignment.bottomLeft,
    Alignment.bottomRight,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Align")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: AnimatedAlign(
                    alignment: alignment,
                    duration: const Duration(seconds: 1),
                    curve: Curves.decelerate,
                    child: const FlutterLogo(size: 50.0),
                    onEnd: () => setState(() {
                      int index = alignments.indexOf(alignment);
                      if (index == alignments.length - 1) return;
                      alignment = alignments[index + 1];
                    }),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  if (alignment == Alignment.bottomRight) {
                    alignment = Alignment.topLeft;
                  } else {
                    alignment = Alignment.topRight;
                  }
                }),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("Animar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
