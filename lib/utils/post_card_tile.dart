import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:knovator_assignment/cosnt/color_const.dart';
import 'package:knovator_assignment/model/post_data_model.dart';
import 'package:knovator_assignment/utils/app_text.dart';
import 'package:knovator_assignment/utils/spacers.dart';
import 'package:knovator_assignment/view/home/home_viewmodel.dart';
import 'package:knovator_assignment/view/post%20card/post_card_view.dart';
import 'package:provider/provider.dart';

class PostCardTile extends StatelessWidget {
  final PostData data;
  final int time;
  final int index;
  const PostCardTile(
      {super.key, required this.data, required this.time, required this.index});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(closedBuilder: (context, onclose) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Provider.of<HomeViewmodel>(context, listen: false)
                    .markedIndex
                    .contains(index)
                ? Theme.of(context).scaffoldBackgroundColor
                : colors.unreadColor,
            border: const Border(
                bottom: BorderSide(color: colors.disableColor, width: 2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceRegular,
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: colors.gradientColor),
                  ),
                ),
                horizontalSpaceSmall,
                AppText(
                  text: "User${data.userId}",
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                AppText(
                  text: "$time",
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            verticalSpaceSmall,
            AppText(
              text: data.title,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
            verticalSpaceSmall,
            verticalSpaceSmall
          ],
        ),
      );
    }, openBuilder: (context, onOpen) {
      return PostCardView(
        post: data,
        index: index,
      );
    });
  }
}
