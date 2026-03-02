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
  static const double _bottomButtonHeight = 56.0;
  static const double _bottomButtonMargin = 24.0;  // top: 0.8, bottom: 16.0
  static const double _bottomButtonTotalHeight = _bottomButtonHeight + _bottomButtonMargin;

  @override
  Widget build(BuildContext context) {
    final hasAppBar = appBar != null;
    final hasBottomButton = bottomButton != null;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final appBarTotalHeight = statusBarHeight + _appBarHeight;

    return Scaffold(
      backgroundColor: Colors.lightGreen,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: _buildMainContent(
              context: context,
              hasAppBar: hasAppBar,
              hasBottomButton: hasBottomButton,
              appBarTotalHeight: appBarTotalHeight
            ),
          ),

          // appBar
          if (hasAppBar)
            _buildTopAppBar(
              appBarTotalHeight: appBarTotalHeight,
              appBar: appBar!
            ),

          if (hasBottomButton)
            _buildBottomButton(
              bottomButtonHeight: _bottomButtonHeight,
              bottomButtonTotalHeight: _bottomButtonTotalHeight,
              bottomButton: bottomButton!
            )
        ],
      ),
    );
  }

  Widget _buildMainContent ({
    required BuildContext context,
    required bool hasAppBar,
    required bool hasBottomButton,
    required double appBarTotalHeight
  }){
    return NestedScrollView(
      clipBehavior: Clip.none,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        if (hasAppBar)
          SliverToBoxAdapter(
            child: SizedBox(height: appBarTotalHeight),
          ),
      ],
      body: CustomScrollView(
        clipBehavior: Clip.none,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: hasBottomButton ? _bottomButtonTotalHeight + 20.0 : 20.0
            ),
            sliver: SliverToBoxAdapter(
              child: body,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTopAppBar ({
    required double appBarTotalHeight,
    required Widget appBar
  }) {
    return Positioned(
      top: 0, left: 0, right: 0,
      height: appBarTotalHeight,
      child: Stack(
        children: [
          // appBar design (gradation)
          IgnorePointer(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 1.0],
                      colors: [
                        Colors.white.withValues(alpha: 1.0),
                        Colors.white.withValues(alpha: 0.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // appBar content
          SafeArea(
            bottom: false,
            child: SizedBox(
              height: _appBarHeight,
              child: appBar,
            ),
          )
        ]
      )
    );
  }

  Widget _buildBottomButton({
    required double bottomButtonHeight,
    required double bottomButtonTotalHeight,
    required Widget bottomButton
  }) {
    return Positioned(
      bottom: 0, left: 0, right: 0,
      height: bottomButtonTotalHeight,
      child: Stack(
        children: [
          // bottomButton design (gradation)
          IgnorePointer(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  height: bottomButtonTotalHeight,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 1.0],
                      colors: [
                        Colors.white.withValues(alpha: 0.0),
                        Colors.white.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // bottomButton content
          SafeArea(
            top: false,
            bottom: false,
            child: SizedBox(
              width: double.infinity,
              height: bottomButtonHeight,
              child: Container(
                margin: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                child: bottomButton,
              ),
            ),
          )
        ]
      ),
    );
  }
}