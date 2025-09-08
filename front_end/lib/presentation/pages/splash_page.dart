import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/preloader.dart';
import '../../domain/view_models/splash_viewmodel.dart';

class SplashPage extends StatelessWidget {
  final SplashViewModel viewModel = Get.find<SplashViewModel>();

  @override
  Widget build(BuildContext context) {
    return const Preloader();
  }
}
