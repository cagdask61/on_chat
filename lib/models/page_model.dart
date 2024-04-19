import 'package:flutter/material.dart';

class PageModel {
  final Widget screen;
  final Widget title;
  final PageNavigationModel navigationModel;

  const PageModel({
    required this.screen,
    required this.title,
    required this.navigationModel,
  });
}

class PageNavigationModel {
  final Widget icon;
  final Widget? selectedIcon;
  final String label;

  const PageNavigationModel({
    required this.icon,
    required this.label,
    this.selectedIcon,
  });
}
