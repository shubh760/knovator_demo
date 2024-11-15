import 'package:flutter/material.dart';
import 'package:knovator_assignment/cosnt/color_const.dart';
import 'package:knovator_assignment/model/post_data_model.dart';
import 'package:knovator_assignment/service/local_db.dart';
import 'package:knovator_assignment/utils/app_text.dart';
import 'package:knovator_assignment/utils/spacers.dart';
import 'package:knovator_assignment/view/home/home_viewmodel.dart';
import 'package:knovator_assignment/view/post%20card/post_card_viewmodel.dart';
import 'package:provider/provider.dart';

class PostCardView extends StatefulWidget {
  final PostData post;
  final int index;
  const PostCardView({super.key, required this.post, required this.index});

  @override
  State<PostCardView> createState() => _PostCardViewState();
}

class _PostCardViewState extends State<PostCardView> {
  @override
  void initState() {
    Provider.of<PostCardViewmodel>(context, listen: false)
        .fetchData(widget.post.id);
    super.initState();
    markRead();
  }

  Future markRead() async {
    final indexStorage = IndexStorage();
    bool isPresent = Provider.of<HomeViewmodel>(context, listen: false)
        .markedIndex
        .contains(widget.index);
    if (!isPresent) {
      await indexStorage.addIndex(widget.index);
      Provider.of<HomeViewmodel>(context, listen: false)
          .addMarkedIndex(widget.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PostCardViewmodel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          title: AppText(
            text: "Post ${widget.post.id}",
            color: Theme.of(context).primaryColor,
          ),
          toolbarHeight: 50,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: colors.disableColor, width: 2))),
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
                              gradient:
                                  LinearGradient(colors: colors.gradientColor)),
                        ),
                        horizontalSpaceSmall,
                        AppText(
                          text: "User ${widget.post.userId}",
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        /* AppText(
                          text: widget.post.publishedAt,
                          color: Theme.of(context).primaryColor,
                          size: 10.0,
                        ), */
                      ],
                    ),
                    verticalSpaceSmall,
                    AppText(
                      text: widget.post.title,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    verticalSpaceSmall,
                    verticalSpaceSmall
                  ],
                ),
              ),
              verticalSpaceSmall,
              AppText(
                text: "Comments",
                color: Theme.of(context).primaryColor,
              ),
              const Divider(),
              verticalSpaceRegular,
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: model.comments.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                        colors: colors.gradientColor)),
                              ),
                              horizontalSpaceSmall,
                              AppText(
                                text: "Comment User $index",
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          verticalSpaceTiny,
                          AppText(
                            text: model.comments[index].comment,
                            color: Theme.of(context).primaryColor,
                          ),
                          verticalSpaceSmall,
                          const Divider()
                        ],
                      ),
                    );
                  })
            ],
          ),
        ),
      );
    });
  }
}
