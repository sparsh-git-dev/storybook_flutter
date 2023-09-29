import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:xml/xml.dart' as xml;

class XmlRead extends StatefulWidget {
  @override
  _XmlReadState createState() => _XmlReadState();
}

class _XmlReadState extends State<XmlRead> {
  List<String> _xmlData = [];

  @override
  void initState() {
    super.initState();
    _loadXmlData();
  }

  Future<void> _loadXmlData() async {
    try {
      final String xmlString = await rootBundle.loadString('data.xml');
      final document = xml.XmlDocument.parse(xmlString);
      final elements = document.findAllElements(
          'item'); // Change 'item' to the element name you want to extract

      _xmlData = elements.map((element) => element.text).toList();
    } catch (e) {
      print('Error loading XML: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Read XML Example'),
        ),
        body: Center(
          child: _xmlData.isEmpty
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: _xmlData.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_xmlData[index]),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
