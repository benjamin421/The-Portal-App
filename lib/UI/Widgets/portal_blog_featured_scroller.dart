import 'package:fiber/Models/wp_blog.dart';
import 'package:fiber/UI/Widgets/overlayed_container.dart';
import 'package:fiber/UI/Widgets/portal_episode_card.dart';
import 'package:flutter/material.dart';
import '../View/blog_web_view.dart';

class PortalBlogPageView extends StatelessWidget {
  final List<WpBlog> blogs;

  const PortalBlogPageView({Key key, this.blogs}) : super(key: key);

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
        : Container(
            height: MediaQuery.of(context).size.height * .35,
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            child: PageView.builder(
              controller: PageController(viewportFraction: .76),
              scrollDirection: Axis.horizontal,
              itemCount: blogs.length,
              itemBuilder: (context, index) => OverlayedContainer(
                date:
                    '${blogs[index].date?.month.toString()}/${blogs[index].date.day.toString()}/${blogs[index].date.year.toString()}',
                title: blogs[index].title.rendered,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlogWebView(blogs[index].link))),
              ),
            ),
          );
  }
}
