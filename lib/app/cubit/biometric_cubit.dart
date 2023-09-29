import 'package:bloc_learn/helpers/biometric.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'biometric_state.dart';

class BiometricCubit extends HydratedCubit<BiometricState> {
  BiometricCubit() : super(const BiometricState());

  @override
  BiometricState? fromJson(Map<String, dynamic> json) {
    return BiometricState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(BiometricState state) {
    return BiometricState.toJson(state);
  }

  Future<void> toggleAuth({bool isEnabled = false}) async {
    final toggle = await BiometricHelper.checkAuthentication();
    if (toggle == 'success') {
      emit(state.copyWith(isBiometricEnabled: isEnabled, isVerified: true));
    }
  }

  Future<bool> checkBiometric() async {
    final toggle = await BiometricHelper.checkAuthentication();
    if (toggle == 'success') {
      emit(
        state.copyWith(
          isFailed: false,
          isVerified: true,
        ),
      );
      return true;
    } else {
      emit(
        state.copyWith(
          isFailed: true,
          isVerified: false,
        ),
      );
      return false;
    }
  }
}
