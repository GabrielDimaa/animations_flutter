import 'dart:math';

import 'package:flutter/material.dart';

class AnimationListState extends StatefulWidget {
  const AnimationListState({Key? key}) : super(key: key);

  @override
  State<AnimationListState> createState() => _AnimationListStateState();
}

class _AnimationListStateState extends State<AnimationListState> {
  GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  List<String> list = List.generate(10, (index) => "Index ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated List State")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: AnimatedList(
                  key: listKey,
                  initialItemCount: list.length,
                  itemBuilder: (BuildContext context, int index, Animation<double> animation) {
                    final String text = list[index];
                    return SlideTransition(
                      position: animation.drive(
                        Tween(
                          begin: const Offset(1.0, 0.0),
                          end: Offset.zero,
                        ),
                      ),
                      child: ListTile(
                        title: Text(text),
                        trailing: IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () => setState(() {
                            list.removeAt(index);
                            listKey.currentState?.removeItem(index, (context, animation) {
                              return SizeTransition(
                                sizeFactor: animation.drive(CurveTween(curve: Curves.decelerate)),
                                child: ListTile(
                                  title: Text(text),
                                ),
                              );
                            });
                          }),
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () => setState(() {
                  list.insert(0, "Index ${Random().nextInt(100).toString()}");
                  listKey.currentState?.insertItem(0);
                }),
                child: const Text("Adicionar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
