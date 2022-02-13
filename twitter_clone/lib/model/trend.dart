class TrendTopic {
  String? location;
  String? hashtag;
  String? tweets;

  TrendTopic({this.location, this.hashtag, this.tweets});

  TrendTopic.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    hashtag = json['hashtag'];
    tweets = json['tweets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['location'] = location;
    data['hashtag'] = hashtag;
    data['tweets'] = tweets;
    return data;
  }
}
