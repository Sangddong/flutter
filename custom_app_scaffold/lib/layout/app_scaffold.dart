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

  @override
  Widget build(BuildContext context) {
    final hasAppBar = appBar != null;
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
              body: bodyScrollView(),
            ),
          ),

          // 층 2: 블러 & 흰색 그라데이션
          if (hasAppBar)
            appBarDesign(totalAppBarHeight),

          // 층 3: 실제 앱바
          if (hasAppBar)
            appBarContent(appBar!)
        ],
      ),
    );
  }

  bodyScrollView(){
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(20.0),
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
  appBarContent(Widget appBar){
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
}