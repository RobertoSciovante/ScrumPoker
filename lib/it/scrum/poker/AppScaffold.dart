// ignore_for_file: prefer_expression_function_bodies, public_member_api_docs, diagnostic_describe_all_properties

import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'AppConfig.dart';

class AppScaffold extends Scaffold {
  const AppScaffold({
    Key? key,
    var appBar,
    var body,
    var floatingActionButton,
    var floatingActionButtonLocation,
    var floatingActionButtonAnimator,
    var persistentFooterButtons,
    var drawer,
    var onDrawerChanged,
    var endDrawer,
    var onEndDrawerChanged,
    var bottomNavigationBar,
    var bottomSheet,
    var backgroundColor,
    var resizeToAvoidBottomInset,
    var primary = true,
    var drawerDragStartBehavior = DragStartBehavior.start,
    var extendBody = false,
    var extendBodyBehindAppBar = false,
    var drawerScrimColor,
    var drawerEdgeDragWidth,
    var drawerEnableOpenDragGesture = true,
    var endDrawerEnableOpenDragGesture = true,
    var restorationId,
    this.safeArea = true,
    this.lock = false,
    this.lockColor,
  }) : super(
          key: key,
          appBar: appBar,
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          persistentFooterButtons: persistentFooterButtons,
          drawer: drawer,
          onDrawerChanged: onDrawerChanged,
          endDrawer: endDrawer,
          onEndDrawerChanged: onEndDrawerChanged,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          restorationId: restorationId,
        );

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
        if (AppConfig.debugMode || AppConfig.flavor != Flavor.PROD)
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
      var height = MediaQuery.of(context).viewPadding.top;
      var width = MediaQuery.of(context).size.width;

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
