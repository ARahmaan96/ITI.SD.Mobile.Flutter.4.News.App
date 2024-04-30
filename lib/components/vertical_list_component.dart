import 'package:flutter/material.dart';
import 'package:news_app/components/news_card_component.dart';
import 'package:news_app/models/news_item_model.dart';

class VerticalListComponent extends StatelessWidget {
  final List<NewsItemModel> items;
  const VerticalListComponent({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: items.length,
        (context, index) {
          return NewsCardComponent(
            item: items[index],
          );
        },
      ),
    );
  }
}
