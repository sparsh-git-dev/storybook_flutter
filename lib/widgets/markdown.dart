import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkDown extends StatefulWidget {
  const MarkDown({super.key});

  @override
  State<MarkDown> createState() => _MarkDownState();
}

class _MarkDownState extends State<MarkDown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Markdown(
        data: "## Cred Widget Library",
        // data: snapshot.data!,
        styleSheet: MarkdownStyleSheet(
          h1: TextStyle(color: Colors.green),
          h2: TextStyle(color: Colors.green),
          h3: TextStyle(color: Colors.purpleAccent),
          code: TextStyle(
            color: Colors.pinkAccent,
            backgroundColor: Colors.transparent,
          ),
          codeblockDecoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
              width: 0.6,
            ),
          ),
        ),
      ),
      // body: FutureBuilder(
      //     future: rootBundle.loadString("/doc/README.md"),
      //     builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      //       if (snapshot.hasData) {
      //         return Markdown(
      //           data: "## Cred Widget Library",
      //           // data: snapshot.data!,
      //           styleSheet: MarkdownStyleSheet(
      //             h1: TextStyle(color: Colors.green),
      //             h2: TextStyle(color: Colors.green),
      //             h3: TextStyle(color: Colors.purpleAccent),
      //             code: TextStyle(
      //               color: Colors.pinkAccent,
      //               backgroundColor: Colors.transparent,
      //             ),
      //             codeblockDecoration: BoxDecoration(
      //               color: Colors.grey.withOpacity(0.1),
      //               borderRadius: BorderRadius.circular(12.0),
      //               border: Border.all(
      //                 color: Colors.black.withOpacity(0.2),
      //                 width: 0.6,
      //               ),
      //             ),
      //           ),
      //         );
      //       }

      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }),
    );
  }
}
