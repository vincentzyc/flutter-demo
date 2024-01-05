// import 'package:json_annotation/json_annotation.dart';
// import "user.dart";
// part 'repo.g.dart';

// @JsonSerializable()
// class Repo {
//   Repo({required owner, required String name, required String full_name});

//   late num id;
//   late String name;
//   late String full_name;
//   late User owner;
//   Repo? parent;
//   late bool private;
//   late String description;
//   late bool fork;
//   String? language;
//   late num forks_count;
//   late num stargazers_count;
//   late num size;
//   late String default_branch;
//   late num open_issues_count;
//   late String pushed_at;
//   late String created_at;
//   late String updated_at;
//   num? subscribers_count;
//   Map<String,dynamic>? license;
  
//   factory Repo.fromJson(Map<String,dynamic> json) => _$RepoFromJson(json);
//   Map<String, dynamic> toJson() => _$RepoToJson(this);
// }

class Repo {
  final Owner owner;
  final String name;
  final String full_name;
  final String description;
  final bool fork;
  final int stargazers_count;
  final int open_issues_count;
  final int forks_count;
  final bool private;
  final String language;

  Repo({
    required this.owner,
    required this.name,
    required this.full_name,
    required this.description,
    required this.fork,
    required this.stargazers_count,
    required this.open_issues_count,
    required this.forks_count,
    required this.private,
    required this.language,
  });
}

class Owner {
  final String login;

  Owner({required this.login});
}