import 'dart:async';

import 'package:bloc_learn/app/cubit/connectivity_cubit.dart';
import 'package:bloc_learn/authentication/bloc/authentication_bloc.dart';
import 'package:flutter/widgets.dart';

class AppService extends ChangeNotifier {
  AppService(this.authenticationBloc, this.connectivityCubit) {
    _blocStreamAuth = authenticationBloc.stream.listen((event) {
      notifyListeners();
    });
    _cubitStreamConn = connectivityCubit.stream.listen((event) {
      // log(event.networkStatus.toString());
      notifyListeners();
    });
  }

  late final StreamSubscription<AuthenticationState> _blocStreamAuth;
  late final StreamSubscription<ConnectivityState> _cubitStreamConn;

  final AuthenticationBloc authenticationBloc;
  final ConnectivityCubit connectivityCubit;

  @override
  void dispose() {
    _blocStreamAuth.cancel();
    _cubitStreamConn.cancel();
    super.dispose();
  }
}
