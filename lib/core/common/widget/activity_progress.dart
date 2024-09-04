import 'package:flutter/material.dart';
import '../app_color.dart';

class ActivityProgressIndicator extends StatelessWidget {
  const ActivityProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: ColorLight.primary,
      ),
    );
  }
}
