import 'package:flutter/material.dart';
import 'package:knovator_assignment/utils/post_card_tile.dart';
import 'package:knovator_assignment/view/home/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<HomeViewmodel>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewmodel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ListView.builder(
            itemCount: model.dataList.length,
            itemBuilder: (context, index) {
              return VisibilityDetector(
                key: Key('${model.dataList[index].id}'),
                onVisibilityChanged: (VisibilityInfo info) {
                  model.changeVisibility(index, info.visibleFraction > 0);
                },
                child: PostCardTile(
                  data: model.dataList[index],
                  time: model.timers[index],
                  index: index,
                ),
              );
            }),
      );
    });
  }
}
