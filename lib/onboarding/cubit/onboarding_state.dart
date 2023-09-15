part of 'onboarding_cubit.dart';

class OnboardingState extends Equatable {
  const OnboardingState({
    this.isOnboardingShown = false,
  });

  final bool isOnboardingShown;

  OnboardingState copyWith({bool? isOnboardingShown}) {
    return OnboardingState(
      isOnboardingShown: isOnboardingShown ?? this.isOnboardingShown,
    );
  }

  @override
  List<Object> get props => [
        isOnboardingShown,
      ];

  static OnboardingState? fromJson(Map<String, dynamic> json) {
    var isOnboardingShown = false;
    if (json['isOnboardingShown'] != null) {
      isOnboardingShown = bool.parse(json['isOnboardingShown'].toString());
    }
    return OnboardingState(isOnboardingShown: isOnboardingShown);
  }

  static Map<String, dynamic>? toJson(OnboardingState state) {
    return {
      'isOnboardingShown': state.isOnboardingShown,
    };
  }
}
