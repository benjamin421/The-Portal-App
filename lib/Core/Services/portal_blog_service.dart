import 'dart:async';
import 'package:fiber/Core/Services/api_service.dart';

import 'package:fiber/Core/Helpers/locator.dart';
import 'package:fiber/Models/wp_blog.dart';

class PortalBlogService {
  DataProvider _dataProvider = locator<DataProvider>();

  StreamController<List<WpBlog>> blogsController = StreamController.broadcast();

  clearEpisodes() {
    List<WpBlog> blogs = List<WpBlog>();
    blogsController.add(blogs);
    print("clear");
  }

  Future<List<WpBlog>> getPortalBlogs(int page) async {
    List<WpBlog> blogs = await _dataProvider.getPortalBlogs(page);
    if (blogs != null) {
      blogsController.add(blogs);
    }

    return blogs;
  }
}
