/// AppRoute is an enum class that contains all the routes in the app.
enum AppRoute {
  // Add your routes here
  // This is example route to get you started
  bible('/'),
  ;

  final String path;
  const AppRoute(this.path);
}
