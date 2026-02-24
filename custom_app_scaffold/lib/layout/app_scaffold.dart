import 'dart:ui';

import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBar;

  const AppScaffold({
    required this.body,
    this.appBar,
    super.key,
  });

  static const double _appBarHeight = 56.0;
  static const double _blurHeight = 120.0;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final hasAppBar = appBar != null;

    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Stack(
        children: [

          /// ✅ BODY (항상 SafeArea 적용)
          SafeArea(
            bottom: false,
            child: hasAppBar ?
            SafeArea(
              bottom: false,
              child: SizedBox(
                height: _appBarHeight,
                child: appBar!,
              ),
            ): Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: body,
              ),
          ),

          /// ✅ BLUR
          if (hasAppBar)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: Container(
                    height: _blurHeight + statusBarHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withValues(alpha: 0.9),
                          Colors.white.withValues(alpha: 0.45),
                          Colors.white.withValues(alpha: 0.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

          /// ✅ APP BAR 레이어
          // if (hasAppBar)
          //   Column(
          //     children: [
          //       SafeArea(
          //         bottom: false,
          //         child: SizedBox(
          //           height: _appBarHeight,
          //           child: appBar!,
          //         ),
          //       ),
          //
          //       /// 👇 이게 핵심: body 밀어내는 공간
          //       SizedBox(height: _appBarHeight),
          //     ],
          //   ),
        ],
      ),
    );
  }
}
