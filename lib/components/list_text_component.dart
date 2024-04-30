import 'package:flutter/material.dart';
import 'package:news_app/models/category_item_model.dart';

class ListTextComponent extends StatelessWidget {
  final CategoryItemModel item;
  final bool selected;
  const ListTextComponent(
      {super.key, required this.item, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(
            item.image ?? "assets/images/default/default.png",
          ),
          fit: BoxFit.cover,
        ),
        border: selected
            ? Border.all(
                strokeAlign: BorderSide.strokeAlignInside,
                // Optional border settings
                color: const Color.fromARGB(255, 98, 114, 84), // Border color
                width: 4, // Border width
              )
            : null,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Center(
            child: Text(
              item.title ?? "None",
              style: const TextStyle(
                color: Color.fromARGB(255, 238, 238, 238),
                fontWeight: FontWeight.w500,
                fontSize: 19,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
