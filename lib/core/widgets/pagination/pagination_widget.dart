import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../pagination/custom_footer_builder.dart';


///  Created by harbey on 5/27/2023.
class PaginationWidget extends StatelessWidget {
  final bool isNoData;
  final Function()? onRefresh;
  final Function()? onLoading;
  final Widget child;
  final ScrollController? scrollController;
  final RefreshController refreshController;

  const PaginationWidget({super.key,
    this.isNoData = false,
    required this.child,
    this.onRefresh,
    this.onLoading,
    required this.refreshController,
    this.scrollController});


  @override
  Widget build(BuildContext context) {
    return
    SmartRefresher(
      enablePullUp: true,
      footer: const CustomFooterBuilder(),
      controller: refreshController,
      onRefresh: () => onSmartRefresh(),
      // physics: NeverScrollableScrollPhysics(),
      onLoading: () async {
        if (onLoading != null) {
         await onLoading!();
        }
      },
      scrollController: scrollController,
      scrollDirection: Axis.vertical,
      child: child,
    );
  }

  void onSmartRefresh() async {
    if (onRefresh != null) {
      onRefresh!();
    }
     refreshController.refreshCompleted();
     refreshController.loadComplete();
  }
}
