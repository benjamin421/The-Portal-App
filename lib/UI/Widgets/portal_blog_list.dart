import 'package:fiber/Models/wp_blog.dart';
import 'package:fiber/UI/Widgets/overlayed_container.dart';
import 'package:fiber/UI/Widgets/portal_episode_card.dart';
import 'package:fiber/UI/Widgets/post_container.dart';
import 'package:flutter/material.dart';
import '../View/blog_web_view.dart';

class PortalBlogList extends StatelessWidget {
  final List<WpBlog> blogs;

  const PortalBlogList({Key key, this.blogs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return blogs == null || blogs.length == 0
        ? Column(
            children: <Widget>[
              SizedBox(
                height: 12,
              ),
              Text('Portal Blogs will appear here.')
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "All Posts",
                style: Theme.of(context).textTheme.subtitle,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: blogs.length,
                itemBuilder: (context, i) => PostContainer(
                  date:
                      '${blogs[i].date?.month.toString()}/${blogs[i].date.day.toString()}/${blogs[i].date.year.toString()}',
                  title: "${blogs[i].title.rendered}",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlogWebView(blogs[i].link),
                    ),
                  ),
                ),
              )
            ],
          );
  }
}
