/*
  {
      "source": {"id": null, "name": "TechSpot"},
      "author": "Erika Morphy, Julio Franco",
      "title":
          "Linux could have been brought down by backdoor found in widely used utility - TechSpot",
      "description":
          "Andres Freund, a PostgreSQL developer at Microsoft, was doing some routine micro-benchmarking when he noticed a small 600ms delay with ssh processes, noticing that these were using...",
      "url":
          "https://www.techspot.com/news/102456-linux-could-have-brought-down-backdoor-found-widely.html",
      "urlToImage":
          "https://www.techspot.com/images2/news/bigimage/2024/03/2024-03-31-image-3.jpg",
      "publishedAt": "2024-03-31T14:23:00Z",
      "content":
          "Why it matters: By happenstance Microsoft researcher Andres Freund found malicious code that could break sshd authentication. If it hadn't been discovered it could have posed a grave threat to Linux.… [+4179 chars]"
  }
 */

class NewsItemModel {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt; // Changed type to DateTime
  final String? content;

  NewsItemModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory NewsItemModel.fromJson(Map<String, dynamic> json) {
    return NewsItemModel(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'] != null
          ? DateTime.parse(json['publishedAt'])
          : null,
      content: json['content'],
    );
  }
}
