import 'dart:math';

import 'package:flutter/material.dart';

class AnimationBuilder extends StatefulWidget {
  const AnimationBuilder({Key? key}) : super(key: key);

  @override
  State<AnimationBuilder> createState() => _AnimationBuilderState();
}

class _AnimationBuilderState extends State<AnimationBuilder> with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controllerRelogio;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      reverseDuration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
    controllerRelogio = AnimationController(
      duration: const Duration(seconds: 12),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Builder")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.red, width: 4),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    AnimatedBuilder(
                      animation: controllerRelogio,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: controllerRelogio.value * 2 * 10 * pi,
                          alignment: Alignment.bottomCenter,
                          child: child,
                        );
                      },
                      child: Container(
                        width: 4,
                        height: 42,
                        margin: const EdgeInsets.only(top: 4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: controllerRelogio,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: controllerRelogio.value * 2 * pi,
                          alignment: Alignment.bottomCenter,
                          child: child,
                        );
                      },
                      child: Container(
                        width: 4,
                        height: 36,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (BuildContext context, Widget? child) {
                      return Transform.scale(
                        scale: (controller.value * 5 + 1),
                        child: child,
                      );
                    },
                    child: const Icon(
                      Icons.warning_amber_outlined,
                      size: 40,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    controllerRelogio.dispose();
    super.dispose();
  }
}
