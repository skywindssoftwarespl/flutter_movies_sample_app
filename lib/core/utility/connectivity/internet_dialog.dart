import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/widget/toast.dart';
import 'internet_cubit.dart';

class InternetCubitListener extends StatelessWidget {
  final Widget child;

  const InternetCubitListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state == InternetState.lost) {
          // Show dialog when internet is lost
          showToast(msg: "No internet found");
        }
      },
      child: child,
    );
  }
}
