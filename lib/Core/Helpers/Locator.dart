import 'package:fiber/Core/Services/APIService.dart';
import 'package:fiber/Core/Services/DialogService.dart';
import 'package:fiber/Core/ViewModels/EpisodeTabModel.dart';
import 'package:fiber/Core/ViewModels/PortalBlogModel.dart';

import 'package:get_it/get_it.dart';
import 'package:fiber/Core/Services/NavigationService.dart';
import 'package:fiber/Core/Services/EpisodeService.dart';
import 'package:fiber/Core/Services/PortalBlogService.dart';

import 'package:fiber/Core/Services/AppService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DataProvider());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => EpisodesService());
  locator.registerLazySingleton(() => PortalBlogService());

  locator.registerLazySingleton(() => AppService());
  locator.registerLazySingleton(() => DialogService());

  locator.registerFactory(() => EpisodeTabModel());
  locator.registerFactory(() => PortalBlogsModel());
}
