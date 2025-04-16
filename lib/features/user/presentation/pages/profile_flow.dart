import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileFlow extends StatelessWidget {
  const ProfileFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () => context.push('/profile/settings'),
              icon: const Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: const Placeholder(),
    );
  }
}
