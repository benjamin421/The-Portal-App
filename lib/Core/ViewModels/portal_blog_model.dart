import 'package:fiber/Core/Enums/view_state.dart';
import 'package:fiber/Core/Services/portal_blog_service.dart';

import 'package:fiber/Core/ViewModels/base_model.dart';
import 'package:fiber/Core/Helpers/locator.dart';
import 'package:fiber/Models/wp_blog.dart';

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
