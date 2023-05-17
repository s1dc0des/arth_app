import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
class Home extends _$Home {
  @override
  int build() {
    return currentPage;
  }

  PageController pageController = PageController(keepPage: true);

  int currentPage = 0;

  void changePage(int index) {
    currentPage = index;
    state = currentPage;
    pageController.jumpToPage(index);
  }
}
