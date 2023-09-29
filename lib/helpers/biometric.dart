import 'dart:developer';

import 'package:bloc_learn/app/cubit/biometric_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class BiometricHelper {
  BiometricHelper._();

  static Future<String> checkAuthentication() async {
    final auth = LocalAuthentication();
    final canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    final availableBiometrics = await auth.getAvailableBiometrics();

    if (canAuthenticate) {
      if (availableBiometrics.contains(BiometricType.strong) ||
          availableBiometrics.contains(BiometricType.face)) {
        try {
          final didAuthenticate = await auth.authenticate(
            localizedReason: 'Please authenticate to access the application',
            options: const AuthenticationOptions(
              useErrorDialogs: false,
            ),
          );
          log(didAuthenticate.toString());
          return didAuthenticate ? 'success' : 'failed';
        } on PlatformException catch (e) {
          if (e.code == auth_error.notAvailable) {
            // Add handling of no hardware here.
            log('failed');
            return 'failed';
          } else if (e.code == auth_error.notEnrolled) {
            log('failed');
            return 'failed';
          } else {
            log('failed');
            return 'failed';
          }
        }
      } else {
        log('no available biometrics');
        return 'failed';
      }
    } else {
      log('authentication failed');
      return 'failed';
    }
  }
}

class BiometricPage extends StatelessWidget {
  const BiometricPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BiometricCubit, BiometricState>(
        builder: (context, state) {
          return Switch.adaptive(
            value: state.isBiometricEnabled,
            onChanged: (isEnabled) {
              context.read<BiometricCubit>().toggleAuth(isEnabled: isEnabled);
            },
          );
        },
      ),
    );
  }
}
