import 'package:fiber/Models/PortalEpisode.dart';
import 'package:fiber/Models/WPBlog.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class DataProvider {
  Future<List<PortalEpisode>> getEpisodes() async {
    List<PortalEpisode> episodes = [];
    final url = 'https://api.theportal.wiki/v1/podcasts';

    final response =
        await http.get(url, headers: {'Accept': 'application/json'});
    final responseData = json.decode(response.body);

    List<dynamic> eps = responseData['podcasts'];

    if (eps.length == 0) {
      return null;
    }
    eps.forEach((episode) {
      episodes.add(PortalEpisode.fromJson(episode));
    });
    return episodes;
  }

  Future<List<WpBlog>> getPortalBlogs(int page) async {
    List<WpBlog> blogPosts = [];
    final url =
        'https://blog.theportal.wiki/wp-json/wp/v2/posts?&category=2&page=$page&per_page=100';

    final response =
        await http.get(url, headers: {'Accept': 'application/json'});
    final responseData = json.decode(response.body);
    print(responseData);

    List<dynamic> blogs = responseData;

    if (blogs.length == 0) {
      return null;
    }
    blogs.forEach((post) {
      blogPosts.add(WpBlog.fromJson(post));
    });

    return blogPosts;
  }
}
