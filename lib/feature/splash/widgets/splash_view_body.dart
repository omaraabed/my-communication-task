import 'package:flutter/material.dart';
import 'package:task/core/utils/managers/style_manager/text_style_manager.dart';
import 'package:task/core/utils/navigation/navigation_context_extension.dart';
import 'package:task/core/utils/navigation/router_path.dart';

import '../../../core/shared/animations/scale_animation.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      context.pushReplacementNamed(RouterPath.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScalingTransition(
            duration: Duration(milliseconds: 1500),
            child: Text(
              "Our Store",
              style: TextStyleManager.style32BoldBlackWithWhiteShadow,
            ),
          ),
        ],
      ),
    );
  }
}
