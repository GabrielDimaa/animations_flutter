import 'package:flutter/material.dart';

class AnimationCrossFade extends StatefulWidget {
  const AnimationCrossFade({Key? key}) : super(key: key);

  @override
  State<AnimationCrossFade> createState() => _AnimationCrossFadeState();
}

class _AnimationCrossFadeState extends State<AnimationCrossFade> {
  CrossFadeState crossFadeState = CrossFadeState.showSecond;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Container")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: AnimatedCrossFade(
                    duration: const Duration(seconds: 3),
                    firstChild: const Icon(Icons.photo, size: 100),
                    secondChild: const FlutterLogo(size: 100.0),
                    crossFadeState: crossFadeState,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  crossFadeState = crossFadeState == CrossFadeState.showSecond ? CrossFadeState.showFirst : CrossFadeState.showSecond;
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
