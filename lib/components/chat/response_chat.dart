import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'dart:async';

class ResponseWidget extends StatefulWidget {
  const ResponseWidget({
    super.key,
    required this.markdown,
  });

  final String markdown;

  @override
  _ResponseWidgetState createState() => _ResponseWidgetState();
}

class _ResponseWidgetState extends State<ResponseWidget> {
  String displayedText = '';
  Timer? typingTimer;
  bool isFirstRender = true; // Flag to track first render

  @override
  void initState() {
    super.initState();
    _startTypingAnimation();
  }

  void _startTypingAnimation() {
    if (isFirstRender) {
      int charIndex = 0;

      typingTimer = Timer.periodic(const Duration(milliseconds: 0), (timer) {
        if (charIndex < widget.markdown.length) {
          setState(() {
            displayedText += widget.markdown[charIndex];
            charIndex++;
          });
        } else {
          timer.cancel();
          isFirstRender = false; // Set the flag to false after the animation
        }
      });
    } else {
      // If it's not the first render, display the full text immediately
      displayedText = widget.markdown;
    }
  }

  @override
  void didUpdateWidget(ResponseWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Resetting the animation for the new markdown input if the text changes
    if (oldWidget.markdown != widget.markdown) {
      displayedText = '';
      isFirstRender = true; // Reset the flag for the new input
      _startTypingAnimation();
    }
  }

  @override
  void dispose() {
    typingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 5, top: 5),
      width: double.infinity,
      child: MarkdownBody(
        shrinkWrap: true,
        selectable: true,
        data: displayedText,
        styleSheet: MarkdownStyleSheet(
          h1: const TextStyle(fontSize: 24, color: Colors.blue),
          code: const TextStyle(
              fontSize: 14, color: Colors.green, backgroundColor: Colors.white),
        ),
      ),
    );
  }
}
