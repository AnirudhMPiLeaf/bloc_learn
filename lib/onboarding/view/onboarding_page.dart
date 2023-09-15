import 'package:bloc_learn/onboarding/cubit/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('onboarding'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => context.read<OnboardingCubit>().onboardingToggle(),
          child: const Text('nav'),
        ),
      ),
    );
  }
}
