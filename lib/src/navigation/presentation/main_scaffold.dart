import 'package:flutter/material.dart';

/// Main Scaffold
///
/// Use this widget to wrap screens that don't include a drawer or bottom navigation.
/// Used typically for child screens or onboarding screens.
class MainScaffold extends StatelessWidget {
  final String? title;
  final List<Widget>? actions;
  final bool? automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? drawer;

  const MainScaffold(
      {super.key,
      this.title,
      this.actions,
      this.automaticallyImplyLeading = true,
      this.bottom,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      required this.body,
      this.bottomNavigationBar,
      this.drawer});

  @override
  Widget build(BuildContext context) {
    final String? localAppBarTitle = title;

    return Scaffold(
      appBar: localAppBarTitle == null
          ? null
          : AppBar(
              title: Text(localAppBarTitle),
              actions: actions,
              automaticallyImplyLeading: automaticallyImplyLeading ?? true,
              bottom: bottom,
            ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
      drawer: drawer,
      body: SafeArea(
        child: body,
      ),
    );
  }
}
