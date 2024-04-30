import 'package:flutter/material.dart';
import 'package:news_app/components/horizontal_list_component.dart';
import 'package:news_app/components/vertical_list_component.dart';
import 'package:news_app/models/news_item_model.dart';
import 'package:news_app/services/data_loder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String category = 'Sports';
  late Future<List<NewsItemModel>> news;

  @override
  void initState() {
    super.initState();
    news = DataLoader().loadNews(category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 98, 114, 84),
        centerTitle: true,
        title: const Text(
          "News App",
          style: TextStyle(
            color: Color.fromARGB(255, 238, 238, 238),
            fontSize: 25,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          news = DataLoader().loadNews(category);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: HorizontalList(
                  selected: category,
                  onUpdate: updateCategory,
                  items: DataLoader().loadCategory(),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              // VerticalListComponent(
              //   items: news,
              // )
              FutureBuilder<List<NewsItemModel>>(
                future: news,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()));
                  } else if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                        child: Center(child: Text('Error: ${snapshot.error}')));
                  } else {
                    return VerticalListComponent(
                      items: snapshot.data ?? [],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateCategory(String category) {
    setState(() {
      this.category = category;
      news = DataLoader().loadNews(category);
    });
  }
}
