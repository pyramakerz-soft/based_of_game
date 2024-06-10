part of 'injection_container.dart';

var sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(() => ContactLessonBloc(
      programContactUserUseCases: sl(), getGameUseCases: sl()));
  // sl.registerFactory(() => ReportsBloc(programUserUseCases: sl()));

  //UseCase
  sl.registerLazySingleton(() => ContactLessonUseCases(sl()));
  sl.registerLazySingleton(() => GetGameUseCases(sl()));

  //Repository
  sl.registerLazySingleton<ProgramContactLessonRepository>(() =>
      ContactLessonRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  //Datasources
  sl.registerLazySingleton<DataSourceRemotelyOfContactLesson>(
      () => DataSourceRemotelyOfContactLessonImpl(dio: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton(() => MainApiConnection());
}
