import 'package:flutter/material.dart';

class AnimationContainer extends StatefulWidget {
  const AnimationContainer({Key? key}) : super(key: key);

  @override
  State<AnimationContainer> createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer> {
  bool selected = false;

  double get widthSize => MediaQuery.of(context).size.width;
  double get heightSize => MediaQuery.of(context).size.height;

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
                  child: AnimatedContainer(
                    width: selected ? 100 : widthSize,
                    height: selected ? 100 : heightSize,
                    color: selected ? Colors.red : Colors.blue,
                    alignment: Alignment.center,
                    duration: const Duration(seconds: 2),
                    curve: Curves.linear,
                    onEnd: () => setState(() => selected = !selected),
                    child: AnimatedContainer(
                      width: selected ? 70 : widthSize,
                      height: selected ? 70 : heightSize,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.limeAccent, width: 2),
                      ),
                      duration: const Duration(seconds: 2),
                      curve: Curves.linear,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => setState(() {
                  selected = !selected;
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
