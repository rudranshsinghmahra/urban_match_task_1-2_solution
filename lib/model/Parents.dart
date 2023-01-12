class Parents {
  Parents({
    this.sha,
    this.url,
    this.htmlUrl,
  });

  Parents.fromJson(dynamic json) {
    sha = json['sha'];
    url = json['url'];
    htmlUrl = json['html_url'];
  }
  String? sha;
  String? url;
  String? htmlUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sha'] = sha;
    map['url'] = url;
    map['html_url'] = htmlUrl;
    return map;
  }
}
