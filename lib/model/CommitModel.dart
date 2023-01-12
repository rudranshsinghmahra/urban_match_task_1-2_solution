import 'Parents.dart';

class CommitModel {
  CommitModel({
      this.sha,
      this.nodeId, 
      this.commit, 
      this.url, 
      this.htmlUrl, 
      this.commentsUrl, 
      this.author, 
      this.committer, 
      this.parents,});

  CommitModel.fromJson(dynamic json) {
    sha = json['sha'];
    nodeId = json['node_id'];
    commit = json['commit'];
    url = json['url'];
    htmlUrl = json['html_url'];
    commentsUrl = json['comments_url'];
    author = json['author'];
    committer = json['committer'];
    if (json['parents'] != null) {
      parents = [];
      json['parents'].forEach((v) {
        parents?.add(Parents.fromJson(v));
      });
    }
  }
  String? sha;
  String? nodeId;
  dynamic commit;
  String? url;
  String? htmlUrl;
  String? commentsUrl;
  dynamic author;
  dynamic committer;
  List<Parents>? parents;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sha'] = sha;
    map['node_id'] = nodeId;
    map['commit'] = commit;
    map['url'] = url;
    map['html_url'] = htmlUrl;
    map['comments_url'] = commentsUrl;
    map['author'] = author;
    map['committer'] = committer;
    if (parents != null) {
      map['parents'] = parents?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}