import 'package:flutter/material.dart';
import 'package:quiz/gen/strings.g.dart';

class ProfileEditFlow extends StatelessWidget {
  const ProfileEditFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.profile.edit.title),
      ),
      body: const Placeholder(),
    );
  }
}
