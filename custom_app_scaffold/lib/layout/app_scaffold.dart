import 'dart:ui';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? appBar;
  final Widget? bottomButton;

  const AppScaffold({
    required this.body,
    this.appBar,
    this.bottomButton,
    super.key,
  });

  static const double _appBarHeight = 56.0;
  static const double _bottomButtonHeight = 44.0;
  static const double _totalBottomButtonHeight = _bottomButtonHeight + 28.0;

  @override
  Widget build(BuildContext context) {
    final hasAppBar = appBar != null;
    final hasBottomButton = bottomButton != null;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final totalAppBarHeight = statusBarHeight + _appBarHeight;

    return Scaffold(
      backgroundColor: Colors.lightGreen,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: NestedScrollView(
              clipBehavior: Clip.none,
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                if (hasAppBar)
                  SliverToBoxAdapter(
                    child: SizedBox(height: totalAppBarHeight),
                  ),
              ],
              body: bodyScrollView(hasBottomButton),
            ),
          ),

          // 층 2: 블러 & 흰색 그라데이션
          if (hasAppBar)
            appBarDesign(totalAppBarHeight),

          // 층 3: 실제 앱바
          if (hasAppBar)
            appBarContainer(appBar!),

          if (hasBottomButton)
            bottomButtonDesign(),

          if (hasBottomButton)
            bottomButtonContainer(bottomButton!)
        ],
      ),
    );
  }

  bodyScrollView(bool hasBottomButton){
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: hasBottomButton ? _totalBottomButtonHeight : 20.0),
          sliver: SliverToBoxAdapter(
            child: body,
          ),
        )
      ],
    );
  }

  appBarDesign(double totalAppBarHeight){
    return Positioned(
      top: 0, left: 0, right: 0,
      height: totalAppBarHeight,
      child: IgnorePointer(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.4, 1.0],
                  colors: [
                    Colors.white.withValues(alpha: 0.95),
                    Colors.white.withValues(alpha: 0.6),
                    Colors.white.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  appBarContainer(Widget appBar){
    return Positioned(
      top: 0, left: 0, right: 0,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: _appBarHeight,
          child: appBar,
        ),
      ),
    );
  }

  bottomButtonDesign(){
    return Positioned(
      bottom: 0, left: 0, right: 0,
      height: _totalBottomButtonHeight,
      child: IgnorePointer(
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              height: _bottomButtonHeight,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withValues(alpha: 0.0),
                    Colors.white.withValues(alpha: 0.1),
                    Colors.white.withValues(alpha: 1.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bottomButtonContainer(Widget bottomButton) {
    return Positioned(
      bottom: 0, left: 0, right: 0,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: _bottomButtonHeight,
          margin: const EdgeInsets.only(top: 8.0, bottom: 20.0, left: 16.0, right: 16.0),
          child: bottomButton,
        ),
      ),
    );
  }
}