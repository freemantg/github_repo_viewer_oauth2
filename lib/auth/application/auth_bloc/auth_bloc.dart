import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github_repo_viewer_oauth2/auth/infrastructure/github_authenticator.dart';
import 'package:injectable/injectable.dart';

import '../../domain/auth_failure.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GithubAuthenticator _authenticator;

  AuthBloc({required GithubAuthenticator authenticator})
      : _authenticator = authenticator,
        super(AuthState.initial()) {
    on<AuthEvent>(
      (event, emit) async {
        await event.map(
          checkAndUpdateAuthStatus: (event) =>
              checkAndUpdateAuthStatus(event, emit),
          signIn: (event) => signIn(event, emit),
          signOut: (event) => signOut(event, emit),
        );
      },
    );
  }

  Future<void> checkAndUpdateAuthStatus(
      AuthEvent event, Emitter<AuthState> emit) async {
    emit(
      (await _authenticator.isSignedIn())
          ? AuthState.authenticated()
          : AuthState.unauthenticated(),
    );
  }

  Future<void> signIn(_SignIn event, Emitter<AuthState> emit) async {
    //First we create the grant which will give us the authorization url;
    final grant = _authenticator.createGrant();
    final uri = _authenticator.getAuthorizationUrl(grant);
    final redirectUrl = await event.authorizationCallback(uri);
    final failureOrSuccess = await _authenticator.handleAuthorizationResponse(
      grant,
      redirectUrl.queryParameters,
    );
    failureOrSuccess.fold(
      (failure) => emit(AuthState.failure(failure)),
      (r) => emit(AuthState.authenticated()),
    );
    grant.close();
  }

  Future<void> signOut(AuthEvent event, Emitter<AuthState> emit) async {
    final failureOrSuccess = await _authenticator.signOut();
    emit(
      failureOrSuccess.fold(
        (failure) => AuthState.failure(failure),
        (r) => const AuthState.unauthenticated(),
      ),
    );
  }
}
