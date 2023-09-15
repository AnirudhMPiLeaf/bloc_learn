import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends HydratedCubit<OnboardingState> {
  OnboardingCubit({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const OnboardingState());
  final AuthenticationRepository _authenticationRepository;

  void onboardingToggle() {
    // final bool isOnboardingShown;
    // if (state.isOnboardingShown != null) {
    //   isOnboardingShown = !state.isOnboardingShown!;
    // } else {
    //   isOnboardingShown = true;
    // }
    emit(
      state.copyWith(
        isOnboardingShown: !state.isOnboardingShown,
      ),
    );
    log(state.isOnboardingShown.toString());
  }

  @override
  OnboardingState? fromJson(Map<String, dynamic> json) {
    return OnboardingState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(OnboardingState state) {
    return OnboardingState.toJson(state);
  }
}
