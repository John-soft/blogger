part of '../../../../core/dependencies.dart/auth_provider_dependencies.dart';

final remoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final supabaseClient = Supabase.instance.client;
  return AuthRemoteDataSourceImpl(supabaseClient);
});

final connectionCheckerProvider = Provider<ConnectionChecker>((ref) {
  final internetConnection = InternetConnection();
  return ConnectionCheckerImpl(internetConnection);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.read(remoteDataSourceProvider);
  final connectionChecker = ref.read(connectionCheckerProvider);
  return AuthRepositoryImpl(remoteDataSource, connectionChecker);
});

final signUpProvider = Provider<UserSignUp>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return UserSignUp(authRepository);
});

final signInProvider = Provider<UserLogin>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return UserLogin(authRepository);
});

final currentUserProvider = Provider<CurrentUser>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return CurrentUser(authRepository);
});

class AuthNotifier extends StateNotifier<UserModel> {
  final UserLogin _userLogin;
  final UserSignUp _userSignUp;
  final CurrentUser _currentUser;

  AuthNotifier(
      {required UserLogin userLogin,
      required UserSignUp userSignUp,
      required CurrentUser currentUser})
      : _userLogin = userLogin,
        _userSignUp = userSignUp,
        _currentUser = currentUser,
        super(UserModel(
            id: 'id', name: 'name', email: 'email', password: 'password'));

  void newUserSignUp(String name, String email, String password) async {
    final res = await _userSignUp(
      UserSignUpParams(
        name: name,
        email: email,
        password: password,
      ),
    );
    res.fold(
      (l) => Failure(l.message),
      (r) => r,
    );
  }

  void newUserLogin(String email, String password) async {
    final res =
        await _userLogin(UserLoginParams(email: email, password: password));

    res.fold((l) => Failure(l.message), (r) => r);
  }

  void currentUser() async {
    final res = await _currentUser(NoParams());
    res.fold(
      (l) => Failure(l.message),
      (r) => r,
    );
  }

  // AuthNotifier(this._userLogin, this._userSignUp, this._currentUser)
  //     : super(UserModel(
  //           id: 'id', name: 'name', email: 'email', password: 'password'));
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, UserModel>((ref) {
  final signUp = ref.read(signUpProvider);
  final signIn = ref.read(signInProvider);
  final currentUser = ref.read(currentUserProvider);
  return AuthNotifier(
    userLogin: signIn,
    userSignUp: signUp,
    currentUser: currentUser,
  );
});
