

import 'package:fluttergithubapp/model/github_response_model.dart';
import 'package:fluttergithubapp/persistance/repository.dart';
import 'package:rxdart/rxdart.dart';

class GitHubBloc{
  Repository _repository = Repository();
  final _itemsFetcher = PublishSubject<GitHubResponse>();

  Observable<GitHubResponse> get items => _itemsFetcher.stream;

  fetchUserItems(String name) async {
    GitHubResponse userResponse = await _repository.fetchUserItems(name);
    _itemsFetcher.sink.add(userResponse);
  }


  dispose() {
    //_itemsFetcher.close();
  }
}

final githubBloc = GitHubBloc();