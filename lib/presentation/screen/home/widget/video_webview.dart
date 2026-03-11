import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoWebView extends StatefulWidget {
  final String videoUrl;
  const VideoWebView({super.key, required this.videoUrl});

  @override
  State<VideoWebView> createState() => _VideoWebViewState();
}

class _VideoWebViewState extends State<VideoWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
  
    _controller = WebViewController();
    try {
      _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    } catch (e) {
      
    }

    
    String url = widget.videoUrl;
    if (url.contains('watch?v=')) {
      url = url.replaceAll('watch?v=', 'embed/');
    }

    _controller.loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black,
      ),
      child: WebViewWidget(controller: _controller),
    );
  }
}
