// ignore_for_file: lines_longer_than_80_chars
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scrum_poker/com/startingfinace/scrumpoker/AppConfig.dart';

class AppScaffold extends Scaffold {
  const AppScaffold({
    super.key,
    super.appBar,
    super.body,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.drawer,
    super.onDrawerChanged,
    super.endDrawer,
    super.onEndDrawerChanged,
    super.bottomNavigationBar,
    super.bottomSheet,
    super.backgroundColor,
    super.resizeToAvoidBottomInset,
    super.primary = true,
    super.drawerDragStartBehavior = DragStartBehavior.start,
    super.extendBody = false,
    super.extendBodyBehindAppBar = false,
    super.drawerScrimColor,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture = true,
    super.endDrawerEnableOpenDragGesture = true,
    super.restorationId,
    this.safeArea = true,
    this.lock = false,
    this.lockColor,
  });

  final Color? lockColor;
  final bool lock;
  final bool safeArea;

  @override
  AppScaffoldState createState() => AppScaffoldState();
}

class AppScaffoldState extends ScaffoldState {
  @override
  AppScaffold get widget => super.widget as AppScaffold;

  @override
  Widget build(BuildContext context) {
    Widget child = Stack(
      children: [
        super.build(context),
        if (AppConfig.debugMode || AppConfig.flavor != Flavor.production)
          Align(
            alignment: Alignment.bottomLeft,
            child: Banner(
              message: AppConfig.flavor.name.toUpperCase(),
              color: AppConfig.flavor.color,
              textStyle: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
              location: BannerLocation.bottomStart,
            ),
          ),
      ],
    );

    if (widget.lock) {
      child = buildLock(context, child);
    }

    if (widget.safeArea) {
      child = SafeArea(child: child);
    } else {
      final height = MediaQuery.of(context).viewPadding.top;
      final  width = MediaQuery.of(context).size.width;

      child = Stack(
        children: [
          child,
          Positioned(
            top: 0,
            left: 0,
            width: width,
            height: height,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return child;
  }

  Widget buildLock(BuildContext context, Widget child) {
    return AbsorbPointer(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Stack(
          children: [
            child,
            if (widget.lockColor != null) Expanded(child: Container(color: widget.lockColor)),
          ],
        ),
      ),
    );
  }
}
