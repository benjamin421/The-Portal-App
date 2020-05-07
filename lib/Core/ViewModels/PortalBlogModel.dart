import 'package:fiber/Core/Enums/ViewState.dart';
import 'package:fiber/Core/Services/PortalBlogService.dart';

import 'package:fiber/Core/ViewModels/BaseModel.dart';
import 'package:fiber/Core/Helpers/Locator.dart';
import 'package:fiber/Models/WPBlog.dart';

class PortalBlogsModel extends BaseModel {
  final PortalBlogService _blogsService = locator<PortalBlogService>();

  List<WpBlog> blogs = [];

  String errorMessage;

  getPortalBlogs(int page) async {
    setState(ViewState.Busy);

    List<WpBlog> blogs = await _blogsService.getPortalBlogs(page);
    if (blogs == null) {
      errorMessage = "No blogs fetched";
      setState(ViewState.Idle);
      return;
    }

    blogs.forEach((blog) {
      blogs.add(blog);
    });

    setState(ViewState.Idle);
  }
}
