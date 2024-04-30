import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExploreNewsPage extends StatelessWidget {
  final String url;
  const ExploreNewsPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 118, 136, 91),
        centerTitle: true,
        title: const Text(
          "Explore News",
          style: TextStyle(
            color: Color.fromARGB(255, 238, 238, 238),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 238, 238, 238),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted, // Enable JavaScript
      ),
    );
  }
}
