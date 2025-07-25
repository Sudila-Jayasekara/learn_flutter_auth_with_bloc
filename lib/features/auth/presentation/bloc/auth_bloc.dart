import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/usecases/check_auth_status.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/usecases/sign_in.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/usecases/sign_out.dart';
import 'package:learn_flutter_auth_with_bloc/features/auth/domain/usecases/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUp _signUp;
  final SignIn _signIn;
  final SignOut _signOut;
  final CheckAuthStatus _checkAuthStatus;

  AuthBloc({
    required SignUp signUp,
    required SignIn signIn,
    required SignOut signOut,
    required CheckAuthStatus checkAuthStatus,
  }) : _signUp = signUp,
       _signIn = signIn,
       _signOut = signOut,
       _checkAuthStatus = checkAuthStatus,
       super(AuthInitial()) {
    on<AuthSignUpRequested>(_onAuthSignUpRequested);
    on<AuthSignInRequested>(_onAuthSignInRequested);
    on<AuthSignOutRequested>(_onAuthSignOutRequested);
    on<AuthStatusChecked>(_onAuthStatusChecked);
  }

  FutureOr<void> _onAuthSignUpRequested(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _signUp(
      firstName: event.firstName,
      lastName: event.lastName,
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  FutureOr<void> _onAuthSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _signIn(email: event.email, password: event.password);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (token) => emit(AuthAuthenticated(token)),
    );
  }

  FutureOr<void> _onAuthSignOutRequested(
    AuthSignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await _signOut();

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  FutureOr<void> _onAuthStatusChecked(
    AuthStatusChecked event,
    Emitter<AuthState> emit,
  ) async {
        emit(AuthLoading());

    final result = await _checkAuthStatus();

    result.fold(
      (failure) => emit(AuthUnauthenticated()),
      (isLoggedIn) => isLoggedIn 
          ? emit(const AuthAuthenticated('')) 
          : emit(AuthUnauthenticated()),
    );
  }
}
