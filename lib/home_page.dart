import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: SafeArea(
        child: ListView(
          children: [
            _listTile(
              text: 'Animated Align',
              onTap: () => Navigator.pushNamed(context, "/animation_align"),
            ),
            _listTile(
              text: 'Animated Builder',
              onTap: () => Navigator.pushNamed(context, "/animation_builder"),
            ),
            _listTile(
              text: 'Animated Container',
              onTap: () => Navigator.pushNamed(context, "/animation_container"),
            ),
            _listTile(
              text: 'Animated Cross Fade',
              onTap: () => Navigator.pushNamed(context, "/animation_cross_fade"),
            ),
            _listTile(
              text: 'Animated Default Text Style',
              onTap: () => Navigator.pushNamed(context, "/animation_default_text_style"),
            ),
            _listTile(
              text: 'Animated List State',
              onTap: () => Navigator.pushNamed(context, "/animation_list_state"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _listTile({required String text, required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
    );
  }
}
