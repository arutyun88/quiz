import 'package:flutter/material.dart';
import 'package:quiz/features/authentication/presentation/sign_in/widgets/sign_in_footer_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Center(
              child: Text('Log in'),
            ),
            Spacer(),
            SignInFooterWidget(),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
