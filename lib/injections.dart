import 'package:get_it/get_it.dart';
import 'package:scanx/features/analyse_image/data/datasources/analyse_image_local_data_source.dart';
import 'package:scanx/features/analyse_image/data/datasources/analyse_image_remote_data_source.dart';
import 'package:scanx/features/analyse_image/data/repositories/analyse_image_repository_impl.dart';
import 'package:scanx/features/analyse_image/domain/repositories/analyse_image_repository.dart';
import 'package:scanx/features/analyse_image/domain/usecases/get_patients_historic.dart';
import 'package:scanx/features/analyse_image/domain/usecases/send_patient_image_to_analyse.dart';
import 'package:scanx/features/analyse_image/presentation/provider/analyse_image_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> injectDependency() async {
  //provider
  getIt.registerFactory(
      () => AnalyseImageProvider(getHistoric: getIt(), sendImage: getIt()));
  //useCases
  getIt.registerLazySingleton(
      () => SendPatientImageToAnalyse(repository: getIt()));
  getIt.registerLazySingleton(() => GetPatientsHistoric(repository: getIt()));

  //repository
  getIt.registerLazySingleton<AnalyseImageRepository>(() =>
      AnalyseImageRepositoryImpl(
          remoteDataSource: getIt(), localDataSource: getIt()));

  //data source
  getIt.registerLazySingleton<AnalyseImageLocalDataSource>(
    () => AnalyseImageLocalDataSourceImpl(sharedPreferences: getIt()),
  );
  getIt.registerLazySingleton<AnalyseImageRemoteDataSource>(
    () => AnalyseImageRemoteDataSourceImpl(),
  );

  // External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
}
