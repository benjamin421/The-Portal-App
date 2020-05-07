import 'dart:convert';

import 'package:fiber/UI/Widgets/OverlayedContainer.dart';
import 'package:fiber/UI/Widgets/PortalBlogFeaturedScroller.dart';
import 'package:fiber/UI/Widgets/PortalBlogList.dart';
import 'package:fiber/UI/Widgets/PostContainer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../View/BlogWebView.dart';
import '../../Models/WPBlog.dart';
import '../../Core/ViewModels/PortalBlogModel.dart';
import 'package:fiber/UI/View/BaseView.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

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
        print('object');
        if (Provider.of<List<WpBlog>>(context).length == 0)
          model.getPortalBlogs(1);
      },
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: ListView(
            children: <Widget>[
              PortalBlogPageView(
                blogs: Provider.of<List<WpBlog>>(context).toList(),
              ),
              Padding(
                  padding: const EdgeInsets.all(9),
                  child: PortalBlogList(
                    blogs: Provider.of<List<WpBlog>>(context).toList(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
