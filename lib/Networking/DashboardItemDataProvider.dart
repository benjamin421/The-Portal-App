import 'package:http/http.dart' as http;
import 'package:webfeed/webfeed.dart';

class DashboardItemDataProvider {

  String url;
  var client = http.Client();

  DashboardItemDataProvider(String url) {
    this.url = url;
  }

  Future<DashboardItem> retrieveBlogPosts() {
    return client.get(url).then((response) {
      return response.body;
    }).then((bodyString) {
      var channel = new RssFeed.parse(bodyString);
      var title = channel.items[0].title;
      var description = channel.items[0].description;
      var url = channel.items[0].link;
      return DashboardItem(title, description, url);
    });
  }
  
}

class DashboardItem {
  String title;
  String description;
  String url;

  DashboardItem(String title, String description, String url) {
    this.title = title;
    this.description = description;
    this.url = url;
  }
}