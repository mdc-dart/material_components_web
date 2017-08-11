@JS('mdc')
library mdc;

import 'dart:html';
import 'package:func/func.dart';
import 'package:js/js.dart';

@JS()
external void autoInit();

@JS('dialog.MDCDialog')
abstract class MDCDialog {
  @JS()
  external factory MDCDialog(Element surface);

  @JS()
  external static void attachTo(Element surface);

  @JS()
  external bool get open;

  @JS()
  external void set open(bool value);

  @JS()
  external EventTarget get lastFocusedTarget;

  @JS()
  external void set lastFocusedTarget(EventTarget value);

  @JS()
  external void show();

  @JS()
  external void close();
}

@JS()
abstract class MDCDialogUtil {
  @JS()
  external void createFocusTrapInstance(
      Element surfaceEl, Element acceptButtonEl);
}

@JS('dialog.util')
external MDCDialogUtil get mdcDialogUtil;

abstract class MDCDynamicDrawer {
  bool get open;
  void set open(bool value);
}

@JS('drawer.MDCTemporaryDrawer')
abstract class MDCTemporaryDrawer implements MDCDynamicDrawer {
  @JS()
  external factory MDCTemporaryDrawer(Element surface);

  @JS()
  external static void attachTo(Element surface);

  @JS()
  external bool get open;

  @JS()
  external void set open(bool value);
}

@JS('drawer.MDCPersistentDrawer')
abstract class MDCPersistentDrawer implements MDCDynamicDrawer {
  @JS()
  external factory MDCPersistentDrawer(Element surface);

  @JS()
  external static void attachTo(Element surface);

  @JS()
  external bool get open;

  @JS()
  external void set open(bool value);
}

@JS('iconToggle.MDCIconToggle')
abstract class MDCIconToggle {
  @JS()
  external factory MDCIconToggle(Element surface);

  @JS()
  external bool get disabled;

  @JS()
  external void set disabled(bool value);

  @JS()
  external bool get on;

  @JS()
  external void set on(bool value);

  @JS()
  external void refreshToggleData();

  @JS()
  external static void attachTo(Element surface);
}

@JS('ripple.MDCRipple')
abstract class MDCRipple {
  @JS()
  external factory MDCRipple(Element surface);

  @JS()
  external bool get unbounded;

  @JS()
  external void set unbounded(bool value);

  @JS()
  external static void attachTo(Element surface);

  @JS()
  external void activate();

  @JS()
  external void deactivate();
}

@JS('ripple.MDCRippleFoundation')
abstract class MDCRippleFoundation {
  @JS()
  external factory MDCRippleFoundation(MDCRippleFoundationOptions options);

  @JS()
  external void init();
}

@anonymous
@JS()
class MDCRippleFoundationOptions {
  final Func0<bool> browserSupportsCssVars, isUnbounded, isSurfaceActive;
  final VoidFunc1<String> addClass, removeClass;
  final VoidFunc2<String, Func0<Event>> registerInteractionHandler,
      deregisterInteractionHandler;
  final VoidFunc1<Function> registerResizeHandler, deregisterResizeHandler;
  final VoidFunc2Opt1<String, String> updateCssVariable;
  final Func0<Rectangle<num>> computeBoundingRect;
  final Func0<MDCRippleFoundationPageOffset> getWindowPageOffset;

  MDCRippleFoundationOptions(
      {this.browserSupportsCssVars,
      this.isUnbounded,
      this.isSurfaceActive,
      this.addClass,
      this.removeClass,
      this.registerInteractionHandler,
      this.deregisterInteractionHandler,
      this.registerResizeHandler,
      this.deregisterResizeHandler,
      this.updateCssVariable,
      this.computeBoundingRect,
      this.getWindowPageOffset});
}

@anonymous
@JS()
class MDCRippleFoundationPageOffset {}
