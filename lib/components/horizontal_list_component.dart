import 'package:flutter/material.dart';
import 'package:news_app/components/list_text_component.dart';
import 'package:news_app/models/category_item_model.dart';

class HorizontalList extends StatelessWidget {
  final Function onUpdate;
  final List<CategoryItemModel> items;
  final String selected;
  const HorizontalList(
      {super.key,
      required this.onUpdate,
      required this.items,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                onUpdate(items[index].title);
              },
              child: ListTextComponent(
                selected: selected == items[index].title,
                item: items[index],
              ),
            );
          }),
    );
  }
}
