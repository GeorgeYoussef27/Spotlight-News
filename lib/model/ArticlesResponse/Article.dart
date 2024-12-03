
import '../SourcesResponse/Source.dart';

/// source : {"id":"wired","name":"Wired"}
/// author : "Louryn Strampe"
/// title : "The Best All-Clad Cyber Monday Deals"
/// description : "All-Clad makes some of the best—and most expensive—cookware. These Cyber Monday deals can save you some money."
/// url : "https://www.wired.com/story/cyber-monday-2024-all-clad-deals/"
/// urlToImage : "https://media.wired.com/photos/6748ba2aa06f9a91cdfa7973/191:100/w_1280,c_limit/All-Clad-HA1-Hard-Anodized-Nonstick-Fry-Pan-Set-Abstract-Background-112024-SOURCE-Amazon.jpg"
/// publishedAt : "2024-12-02T17:21:48Z"
/// content : "All-Clad cookware is top-notch. We thoroughly recommend it in several buying guides, including our Buy It for Life guide and our kitchen essentials round-up. The cookware is durable and reliable, and… [+3360 chars]"

class Article {
  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}