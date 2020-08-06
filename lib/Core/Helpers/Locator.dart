import 'package:fiber/Core/Services/api_service.dart';
import 'package:fiber/Core/Services/dialog_service.dart';
import 'package:fiber/Core/Services/episode_service.dart';
import 'package:fiber/Core/Services/navigation_service.dart';
import 'package:fiber/Core/Services/portal_blog_service.dart';
import 'package:fiber/Core/ViewModels/episode_tab_model.dart';
import 'package:fiber/Core/ViewModels/portal_blog_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DataProvider());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => EpisodeTabModel());
  locator.registerLazySingleton(() => PortalBlogService());
  locator.registerLazySingleton(() => EpisodesService());

  locator.registerLazySingleton(() => DialogService());

  locator.registerFactory(() => PortalBlogsModel());
}
