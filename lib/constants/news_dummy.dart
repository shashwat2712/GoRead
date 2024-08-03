import 'dart:convert';

import 'package:newsflix/Model/NewsModel.dart';

// Sample JSON data
class DummyData{
  static const jsonString = '''
{
  "source": {
    "id": "wired",
    "name": "Wired"
  },
  "author": "Joel Khalili",
  "title": "Craig Wright Faces Perjury Investigation Over Claims He Created Bitcoin",
  "description": "By order of a UK judge, Craig Wright can no longer claim he is the creator of bitcoin and now faces the prospect of criminal charges.",
  "url": "https://www.wired.com/story/craig-wright-perjury-bitcoin-trial/",
  "urlToImage": "https://images.pexels.com/photos/518543/pexels-photo-518543.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
  "publishedAt": "2024-07-16T12:58:12Z",
  "content": "A judge in the UK High Court has directed prosecutors to consider bringing criminal charges against computer scientist Craig Wright, after ruling that he lied extensively and repeatedly and committed… [+2851 chars]"
}
''';

// Convert JSON string to Map
  static final Map<String, dynamic> jsonData = jsonDecode(jsonString);

// Create a NewsArticle instance from JSON
  static final dummy = NewsModel.fromJson(jsonData);
}