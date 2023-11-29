import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/constants/app_images.dart';
import 'package:reddit_clone/features/auth/controller/auth_controller.dart';
import 'package:reddit_clone/features/auth/widgets/loader.dart';
import 'package:reddit_clone/features/auth/widgets/sign_in_button.dart';
import 'package:reddit_clone/features/auth/widgets/widget_ext.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppImages.mainLogo,
          height: 40,
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: isLoading
          ? const Loader()
          : Column(
              children: [
                30.verticalSpace,
                const Text(
                  'Dive into anything',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    fontSize: 24,
                  ),
                ),
                30.verticalSpace,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    AppImages.loginEmote,
                    height: 400,
                  ),
                ),
                20.verticalSpace,
                const SignInButton()
              ],
            ),
    );
  }
}
