class NewsModel {
  String title;
  List<String> authors;
  String publishDate;
  String text;
  String summary;
  List<String> keywords;
  String? image;

  NewsModel({
    this.title = 'Title Not Available',
    this.authors = const ['unknown'],
    this.publishDate = '',
    this.text = '',
    this.summary = '',
    this.keywords = const [],
    this.image = 'https://miro.medium.com/v2/resize:fit:420/1*nyPTpr8F0leyeJIshD7zuw.jpeg',
  });

  NewsModel.fromJson(Map<String, dynamic> json)
      : title = json['title'] ?? 'Title Not Available',
        authors = List<String>.from(json['authors'] ?? ['unknown']),
        publishDate = json['publish_date'] ?? '',
        text = json['text'] ?? '',
        summary = json['summary'] ?? '',
        keywords = List<String>.from(json['keywords'] ?? []),
        image = json['image'] ?? 'https://miro.medium.com/v2/resize:fit:420/1*nyPTpr8F0leyeJIshD7zuw.jpeg';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['authors'] = authors;
    data['publish_date'] = publishDate;
    data['text'] = text;
    data['summary'] = summary;
    data['keywords'] = keywords;
    data['image'] = image;
    return data;
  }
}
