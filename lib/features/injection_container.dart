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
import 'package:car_renatl_app/features/car/domain/usecases/get_saved_cars.dart';
import 'package:car_renatl_app/features/car/domain/usecases/remove_car.dart';
import 'package:car_renatl_app/features/car/domain/usecases/remove_cars.dart';
import 'package:car_renatl_app/features/car/domain/usecases/save_car.dart';
import 'package:car_renatl_app/features/car/presentation/bloc/local/local_car_bloc.dart';
import 'package:car_renatl_app/features/car/presentation/bloc/remote/remote_car_bloc.dart';
import 'package:car_renatl_app/features/car_booking/data/repository/mock_booking_repository.dart';
import 'package:car_renatl_app/features/car_booking/domain/repositories/booking_repository.dart';
import 'package:car_renatl_app/features/car_booking/domain/usecases/create_booking.dart';
import 'package:car_renatl_app/features/car_booking/domain/usecases/get_booking.dart';
import 'package:car_renatl_app/features/car_booking/domain/usecases/my_bookings.dart';
import 'package:car_renatl_app/features/car_booking/presentation/bloc/booking_bloc.dart';
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
  sl.registerSingleton<GetSavedCarsUseCase>(GetSavedCarsUseCase(sl()));
  sl.registerSingleton<RemoveCarUseCase>(RemoveCarUseCase(sl()));
  sl.registerSingleton<RemoveCarsUseCase>(RemoveCarsUseCase(sl()));
  sl.registerSingleton<SaveCarUseCase>(SaveCarUseCase(sl()));

  //inject remote bloc logic
  sl.registerFactory<LocalCarsBloc>(
    () => LocalCarsBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );
  //inject local bloc logic
  sl.registerFactory<RemoteCarsBloc>(() => RemoteCarsBloc(sl()));

  /////////////////// Booking Section ///////////////////////
  //repo
  sl.registerSingleton<BookingRepository>(MockBookingRepository());

  //usecase
  sl.registerSingleton<CreateBookingUseCase>(CreateBookingUseCase(sl()));
  sl.registerSingleton<GetBookingUseCase>(GetBookingUseCase(sl()));
  sl.registerSingleton<MyBookingsUseCase>(MyBookingsUseCase(sl()));

  // inject bloc logic
  sl.registerFactory<BookingBloc>(() => BookingBloc(sl(), sl()));
}
