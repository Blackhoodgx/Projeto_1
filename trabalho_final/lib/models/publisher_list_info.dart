class PublisherListInfo {
  List publisherList;
  String nextPage;

  PublisherListInfo({required this.publisherList, required this.nextPage});

  String get getNextGame => this.nextPage;
  List get getPublisherList => this.publisherList;
}
