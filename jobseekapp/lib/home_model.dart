enum HomePage {
  HomePopular,
  HomeGraph,
  HomeHistory,
  HomeSetting,
}

class ChangeHomeProvider {
  HomePage homePage;

  ChangeHomeProvider({this.homePage});

  HomePage getHomePage() {
    return homePage;
  }
}

class RepositoryHome {
  ChangeHomeProvider changeHomeProvider;

  RepositoryHome({this.changeHomeProvider});

  int changeHomePage(HomePage homePage) {
    changeHomeProvider.homePage = homePage;

    switch (changeHomeProvider.homePage) {
      case HomePage.HomePopular:
        return 0;
        break;

      case HomePage.HomeGraph:
        return 1;
        break;

      case HomePage.HomeHistory:
        return 2;
        break;

      case HomePage.HomeSetting:
        return 3;
        break;

      default:
        return 0;
    }
  }
}
