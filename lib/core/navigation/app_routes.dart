enum AppRoutes {
  splashView('/splashView', 'SplashView'),
  signInView('/signInView', 'SignInView'),
  usersView('/usersView', 'UsersView'),
  subUsersView(
    'subUsersView',
    'SubUsersView',
    childRoute: '/usersView/subUsersView',
  ),
  subsubUserView('subsubView', "SubSubView",
      childRoute: '/usersView/subUsersView/SubSubView');

  final String path;
  final String name;
  final String? childRoute;

  const AppRoutes(this.path, this.name, {this.childRoute});
}
