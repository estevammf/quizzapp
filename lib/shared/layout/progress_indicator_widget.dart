
import 'package:flutter/material.dart';

import 'layout.dart';

class ProgressIndicatorWidget extends StatelessWidget {

  final double? value;

  const ProgressIndicatorWidget({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(value: value, backgroundColor: AppColors.chartSecondary, valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary));
  }
}