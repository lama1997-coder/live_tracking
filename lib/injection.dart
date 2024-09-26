import 'package:get_it/get_it.dart';
import 'package:live_tracking/data/repository/location_repository_imp.dart';
import 'package:live_tracking/domain/repository/location_repository.dart';
import 'package:live_tracking/domain/usecases/location.dart';
import 'package:live_tracking/presention/bloc/location/import.dart';


final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => LocationBloc(locator()));
  // usecase
  locator.registerLazySingleton(() => Location(locator()));
  // repository
  locator.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImp(
    ),
  ); 
}
