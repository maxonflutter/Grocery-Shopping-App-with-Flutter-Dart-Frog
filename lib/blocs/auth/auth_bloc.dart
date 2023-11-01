import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState(status: AuthInitial, user: null)) {
    on<AppLogin>(_onAppLogin);
    on<AppLogout>(_onAppLogout);
    on<AuthChanged>(_onAuthChanged);
  }

  Future<void> _onAppLogin(AppLogin event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthLoading));
    try {
      await _authRepository.login();
      emit(state.copyWith(status: AuthSuccess));
    } catch (err) {
      emit(state.copyWith(status: AuthFailure));
    }
  }

  Future<void> _onAppLogout(AppLogout event, Emitter<AuthState> emit) async {
    try {
      await _authRepository.logout();
      emit(state.copyWith(status: AuthInitial));
    } catch (err) {
      emit(state.copyWith(status: AuthFailure));
    }
  }

  Future<void> _onAuthChanged(AuthChanged event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthLoading));
    try {
      await emit.forEach(_authRepository.authUserChanged(), onData: (user) {
        return state.copyWith(status: AuthSuccess, user: user);
      });
    } catch (err) {
      emit(state.copyWith(status: AuthFailure));
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}