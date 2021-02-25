import 'package:bloc/bloc.dart';

import 'home_model.dart';

class ChangeHome extends Bloc<HomePage, int> {
  RepositoryHome repositoryHome;

  ChangeHome(this.repositoryHome) : super(0);

  @override
  Stream<int> mapEventToState(HomePage event) async* {
    yield repositoryHome.changeHomePage(event);
  }
}
