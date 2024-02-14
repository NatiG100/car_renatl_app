import 'package:car_renatl_app/features/auth/data/repository/mock_user_repository.dart';
import 'package:car_renatl_app/features/auth/domain/repository/user_repository.dart';
import 'package:car_renatl_app/features/auth/domain/usecases/change_user_profile.dart';
import 'package:car_renatl_app/features/auth/domain/usecases/login.dart';
import 'package:car_renatl_app/features/auth/domain/usecases/logout_user.dart';
import 'package:car_renatl_app/features/auth/domain/usecases/register_user.dart';
import 'package:car_renatl_app/features/auth/domain/usecases/verify_user.dart';
import 'package:car_renatl_app/features/auth/domain/usecases/who_am_i.dart';
import 'package:car_renatl_app/features/auth/presentation/bloc/auth/remote_auth_bloc.dart';
import 'package:car_renatl_app/features/car/data/repository/mock_car_repository.dart';
import 'package:car_renatl_app/features/car/domain/repository/car_repository.dart';
import 'package:car_renatl_app/features/car/domain/usecases/get_cars.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  ////////////////////////// Auth Section ////////////////////////
  //inject the repository
  sl.registerSingleton<UserRepository>(MockUserRepository());

  //inject the usecases
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<LogoutUseCase>(LogoutUseCase(sl()));
  sl.registerSingleton<RegisterUserUseCase>(RegisterUserUseCase(sl()));
  sl.registerSingleton<VerifyUserUseCase>(VerifyUserUseCase(sl()));
  sl.registerSingleton<WhoAmIUseCase>(WhoAmIUseCase(sl()));
  sl.registerSingleton<ChangeUserProfileUseCase>(
      ChangeUserProfileUseCase(sl()));

  //inject bloc
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      sl(),
      sl(),
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );

  /////////////////// Cars Section ///////////////////////
  sl.registerSingleton<CarRepository>(MockCarRepository());
  //use cases
  sl.registerSingleton<GetCarsUseCase>(GetCarsUseCase(sl()));
}
