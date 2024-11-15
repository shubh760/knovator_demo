import 'package:flutter/material.dart';
import 'package:knovator_assignment/view/home/home_viewmodel.dart';
import 'package:knovator_assignment/view/post%20card/post_card_viewmodel.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<HomeViewmodel>(create: (context) => HomeViewmodel()),
    ChangeNotifierProvider<PostCardViewmodel>(
        create: (context) => PostCardViewmodel()),
  ];

  static MultiProvider initializeProvider(Widget child) {
    return MultiProvider(
      providers: providers,
      child: child,
    );
  }
}
