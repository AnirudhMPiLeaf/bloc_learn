part of 'biometric_cubit.dart';

class BiometricState extends Equatable {
  const BiometricState({
    this.isBiometricEnabled = false,
    this.isFailed = false,
    this.isVerified = false,
  });

  final bool isBiometricEnabled;
  final bool isFailed;
  final bool isVerified;

  @override
  List<Object> get props => [
        isBiometricEnabled,
        isFailed,
        isVerified,
      ];

  BiometricState copyWith({
    bool? isBiometricEnabled,
    bool? isFailed,
    bool? isVerified,
  }) {
    return BiometricState(
      isBiometricEnabled: isBiometricEnabled ?? this.isBiometricEnabled,
      isFailed: isFailed ?? this.isFailed,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  static BiometricState? fromJson(Map<String, dynamic> json) {
    final isBiometricEnabled =
        bool.parse(json['isBiometricEnabled'].toString());
    return BiometricState(isBiometricEnabled: isBiometricEnabled);
  }

  static Map<String, dynamic>? toJson(BiometricState state) {
    return {
      'isBiometricEnabled': state.isBiometricEnabled,
    };
  }
}
