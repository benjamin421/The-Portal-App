import 'dart:async';
import 'package:fiber/Core/Services/APIService.dart';

import 'package:fiber/Core/Helpers/Locator.dart';
import 'package:fiber/Models/WPBlog.dart';

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
    print('blogs[0]0000000');

    print(blogs[0].author);
    return blogs;
  }
}
