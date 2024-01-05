import 'package:flutter/material.dart';

import '../models/repo.dart';

List<Repo> generateSampleData() {
  return [
    Repo(
      owner: Owner(login: 'john_doe'),
      name: 'example_repo_1',
      full_name: 'john_doe/example_repo_1',
      description: 'This is a sample repository.',
      fork: false,
      stargazers_count: 42,
      open_issues_count: 5,
      forks_count: 10,
      private: false,
      language: 'Dart',
    ),
    Repo(
      owner: Owner(login: 'jane_doe'),
      name: 'example_repo_2',
      full_name: 'jane_doe/example_repo_2',
      description: 'Another sample repository.',
      fork: true,
      stargazers_count: 30,
      open_issues_count: 8,
      forks_count: 15,
      private: true,
      language: 'JavaScript',
    ),
    Repo(
      owner: Owner(login: 'jane_doe'),
      name: 'example_repo_3',
      full_name: 'jane_doe/example_repo_3',
      description: 'Another sample repository.',
      fork: true,
      stargazers_count: 30,
      open_issues_count: 8,
      forks_count: 15,
      private: true,
      language: 'JavaScript',
    ),
    Repo(
      owner: Owner(login: 'jane_doe'),
      name: 'example_repo_4',
      full_name: 'jane_doe/example_repo_4',
      description: 'Another sample repository.',
      fork: true,
      stargazers_count: 30,
      open_issues_count: 8,
      forks_count: 15,
      private: true,
      language: 'JavaScript',
    ),
    Repo(
      owner: Owner(login: 'jane_doe'),
      name: 'example_repo_4',
      full_name: 'jane_doe/example_repo_4',
      description: 'Another sample repository.',
      fork: true,
      stargazers_count: 30,
      open_issues_count: 8,
      forks_count: 15,
      private: true,
      language: 'JavaScript',
    ),
    // Add more sample data as needed
  ];
}

class RepoList extends StatefulWidget {
  // 将`repo.id`作为RepoItem的默认key
  // RepoList(this.repo) : super(key: ValueKey(repo.id));
  // final Repo repo;

  const RepoList({super.key});

  @override
  State<RepoList> createState() => _RepoListState();
}

class _RepoListState extends State<RepoList> {
  List<Repo> repoList = generateSampleData();

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemCount: repoList.length,
    //   itemBuilder: (context, index) {
    //     return _repoItem(context, index);
    //   },
    // );
    return Column(
      children: <Widget>[
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: repoList.length,
          itemBuilder: (context, index) {
            return _repoItem(context, index);
          },
        ),
      ],
    );
  }

  Widget _repoItem(BuildContext context, int index) {
    String subtitle = '子标题';
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Material(
        color: Colors.white,
        shape: BorderDirectional(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 0.5,
          ),
        ),
        child: SizedBox(
          // 添加容器来提供确定高度
          // height: MediaQuery.of(context).size.height, // 根据需要设置合适的高度
          child: Padding(
            padding: const EdgeInsets.only(top: 0.0, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  dense: true,
                  // leading: gmAvatar(
                  //   //项目owner头像
                  //   repoList[index].owner.avatar_url,
                  //   width: 24.0,
                  //   borderRadius: BorderRadius.circular(12),
                  // ),
                  title: Text(
                    repoList[index].owner.login,
                    textScaleFactor: 0.9,
                  ),
                  subtitle: Text(subtitle + index.toString()),
                  trailing: Text(repoList[index].language),
                ),
                // 构建项目标题和简介
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        repoList[index].fork
                            ? repoList[index].full_name
                            : repoList[index].name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: repoList[index].fork
                              ? FontStyle.italic
                              : FontStyle.normal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 12),
                        child: repoList[index].description == null
                            ? Text(
                                '暂无描述',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.grey[700]),
                              )
                            : Text(
                                repoList[index].description!,
                                maxLines: 3,
                                style: TextStyle(
                                  height: 1.15,
                                  color: Colors.blueGrey[700],
                                  fontSize: 13,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
                // 构建卡片底部信息
                _buildBottom(index)
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 构建卡片底部信息
  Widget _buildBottom(int index) {
    const paddingWidth = 10;
    return IconTheme(
      data: const IconThemeData(
        color: Colors.grey,
        size: 15,
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.grey, fontSize: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Builder(builder: (context) {
            var children = <Widget>[
              const Icon(Icons.star),
              Text(repoList[index]
                  .stargazers_count
                  .toString()
                  .padRight(paddingWidth)),
              const Icon(Icons.info_outline),
              Text(repoList[index]
                  .open_issues_count
                  .toString()
                  .padRight(paddingWidth)),

              // const Icon(MyIcons.fork), //我们的自定义图标
              Text(repoList[index]
                  .forks_count
                  .toString()
                  .padRight(paddingWidth)),
            ];

            if (repoList[index].fork) {
              children.add(Text("Forked".padRight(paddingWidth)));
            }

            if (repoList[index].private == true) {
              children.addAll(<Widget>[
                const Icon(Icons.lock),
                Text(" private".padRight(paddingWidth))
              ]);
            }
            return Row(children: children);
          }),
        ),
      ),
    );
  }
}
