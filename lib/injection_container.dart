import 'package:car_renatl_app/features/auth/auth.dart';
import 'package:car_renatl_app/features/car/cart.dart';
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
  sl.registerSingleton<HotDealsUseCase>(HotDealsUseCase(sl()));

  //inject remote bloc logic
  sl.registerFactory<LocalCarsBloc>(
    () => LocalCarsBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );
  sl.registerFactory<HotDealsBloc>(() => HotDealsBloc(sl()));
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
