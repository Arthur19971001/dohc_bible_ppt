import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_size_provider.g.dart';

@Riverpod(keepAlive: true)
Future<void> screenSizeProvider(ScreenSizeProviderRef ref) async {
  await DesktopWindow.setMinWindowSize(const Size(600, 600));
  await DesktopWindow.setMaxWindowSize(const Size(800, 800));
}
