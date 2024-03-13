import 'package:get_it/get_it.dart';
import 'package:scanx/core/presentation/provider/global_provider.dart';
import 'package:scanx/core/utils/network/network.dart';
import 'package:scanx/features/analyse_image/data/datasources/analyse_image_local_data_source.dart';
import 'package:scanx/features/analyse_image/data/datasources/analyse_image_remote_data_source.dart';
import 'package:scanx/features/analyse_image/data/repositories/analyse_image_repository_impl.dart';
import 'package:scanx/features/analyse_image/domain/repositories/analyse_image_repository.dart';
import 'package:scanx/features/analyse_image/domain/usecases/get_patients_historic.dart';
import 'package:scanx/features/analyse_image/domain/usecases/send_patient_image_to_analyse.dart';
import 'package:scanx/features/analyse_image/presentation/provider/analyse_image_provider.dart';
import 'package:scanx/features/auth/data/data%20source/auth_remote_data_source.dart';
import 'package:scanx/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:scanx/features/auth/domain/repositories/auth_repository.dart';
import 'package:scanx/features/auth/domain/usecase/signin_usecase.dart';
import 'package:scanx/features/auth/presentation/provider/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> injectDependency() async {
  //provider
  getIt.registerFactory(() => GlobalProvider());
  getIt.registerFactory(
      () => AnalyseImageProvider(getHistoric: getIt(), sendImage: getIt()));
  getIt.registerFactory(() => AuthProvider(signIn: getIt()));

  //useCases
  getIt.registerLazySingleton(
      () => SendPatientImageToAnalyse(repository: getIt()));
  getIt.registerLazySingleton(() => GetPatientsHistoric(repository: getIt()));
  getIt.registerLazySingleton(() => SigninUsecase(authRepository: getIt()));

  //repository
  getIt.registerLazySingleton<AnalyseImageRepository>(() =>
      AnalyseImageRepositoryImpl(
          remoteDataSource: getIt(), localDataSource: getIt()));
  getIt.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: getIt()));

  //data source
  getIt.registerLazySingleton<AnalyseImageLocalDataSource>(
    () => AnalyseImageLocalDataSourceImpl(sharedPreferences: getIt()),
  );
  getIt.registerLazySingleton<AnalyseImageRemoteDataSource>(
    () => AnalyseImageRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(req: NetworkRequest()),
  );

  // External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}
