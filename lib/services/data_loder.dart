import 'package:dio/dio.dart';
import 'package:news_app/models/category_item_model.dart';
import 'package:news_app/models/news_item_model.dart';

Map data = {
  "category": [
    CategoryItemModel(
      title: "Sports",
      image: "assets/images/sports.jpeg",
    ),
    CategoryItemModel(
      title: "Entertainment",
      image: "assets/images/entertainment.jpeg",
    ),
    CategoryItemModel(
      title: "Health",
      image: "assets/images/health.png",
    ),
    CategoryItemModel(
      title: "Science",
      image: "assets/images/science.jpeg",
    ),
    CategoryItemModel(
      title: "Technology",
      image: "assets/images/technology.jpg",
    ),
    CategoryItemModel(
      title: "General",
      image: "assets/images/general.jpg",
    ),
    CategoryItemModel(
      title: "Business",
      image: "assets/images/business.jpg",
    ),
  ],
};

class DataLoader {
  List<CategoryItemModel> loadCategory() {
    return data["category"];
  }

  Future<List<NewsItemModel>> loadNews(String category) async {
    Dio dio = Dio();
    List<NewsItemModel> result = [];
    final String searchQuery = category != 'General' ? 'q=$category' : 'q=a';
    final url =
        "https://newsapi.org/v2/top-headlines?${searchQuery}&sortBy=popularity&apiKey=6a561e931bc645b896372d6d3d06863c";
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        // Data fetched successfully
        for (var news in response.data["articles"]) {
          result.add(NewsItemModel.fromJson(news));
        }
        print(response.statusCode);
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        result = [];
      }
    } catch (error) {
      print('Error fetching data: $error');
      result = [];
    }
    return result;
  }
}
