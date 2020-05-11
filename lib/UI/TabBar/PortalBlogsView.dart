import 'package:fiber/UI/Widgets/PortalBlogFeaturedScroller.dart';
import 'package:fiber/UI/Widgets/PortalBlogList.dart';
import 'package:flutter/material.dart';
import '../../Models/WPBlog.dart';
import '../../Core/ViewModels/PortalBlogModel.dart';
import 'package:fiber/UI/View/BaseView.dart';
import 'package:provider/provider.dart';
import '../../Core/Enums/ViewState.dart';

class PortalBlogTab extends StatefulWidget {
  @override
  _PortalBlogTabState createState() => _PortalBlogTabState();
}

class _PortalBlogTabState extends State<PortalBlogTab> {
  ScrollController pageScrollController;

  @override
  void initState() {
    pageScrollController = ScrollController(
      initialScrollOffset: 0.0,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<PortalBlogsModel>(
      onModelReady: (model) async {
        if (Provider.of<List<WpBlog>>(context).length == 0)
          model.getPortalBlogs(1);
      },
      builder: (context, model, child) => SafeArea(
          child: Stack(
        children: <Widget>[
          RefreshIndicator(
            onRefresh: () async => await model.getPortalBlogs(1),
            child: ListView(
              physics: ClampingScrollPhysics(),
              controller: pageScrollController,
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Text(
                    'Featured Posts',
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                PortalBlogPageView(
                  blogs: Provider.of<List<WpBlog>>(context).toList(),
                ),
                Padding(
                    padding: const EdgeInsets.all(9),
                    child: PortalBlogList(
                      blogs: Provider.of<List<WpBlog>>(context).toList(),
                    )),
                SizedBox(
                  height: 42,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
