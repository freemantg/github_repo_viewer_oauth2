part of 'auth_bloc.dart';

typedef AuthUriCallback = Future<Uri> Function(Uri authorizationUrl);

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAndUpdateAuthStatus() =
      _CheckAndUpdateAuthStatus;
  const factory AuthEvent.signIn(AuthUriCallback authorizationCallback) =
      _SignIn;
  const factory AuthEvent.signOut() = _SignOut;
}
