import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kpie_assessment/utils/color.dart';

class LoaderPage extends StatelessWidget {
  final Widget child;
  final bool isBusy;
  const LoaderPage({super.key, required this.child, this.isBusy = false,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          if (isBusy)
          Container(
            decoration: BoxDecoration(
              color: AppColors.kBlack.withOpacity(0.5),
            ),
          ),
          if (isBusy)
          const Center(child: CupertinoActivityIndicator(color: AppColors.kWhite,),)
        ],
      ),
    );
  }
}