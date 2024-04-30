import 'package:flutter/material.dart';
import 'package:news_app/models/news_item_model.dart';
import 'package:news_app/pages/explore_news_page.dart';

class NewsCardComponent extends StatelessWidget {
  final NewsItemModel item;
  const NewsCardComponent({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.url != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ExploreNewsPage(url: item.url!);
          }));
        }
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 3),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: item.urlToImage != null
                    ? Image.network(
                        item.urlToImage!,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return LinearProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                            color: const Color.fromARGB(255, 98, 114, 84),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Text('Error loading image');
                        },
                        fit: BoxFit.fitWidth,
                      )
                    : Image.asset(
                        "assets/images/default/default.png",
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            // Title
            Text(
              item.title ?? "[Removed]",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            // Description
            Text(
              item.description ?? "[Removed]",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
