/// AppRoute is an enum class that contains all the routes in the app.
enum AppRoute {
  // Add your routes here
  // This is example route to get you started
  tab1,
  tab2('/tab-2'),
  child('child'),
  example('/example');

  final String path;
  const AppRoute([this.path = '/']);
}
