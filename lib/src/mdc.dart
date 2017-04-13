@JS('mdc')
library mdc;

import 'dart:html';
import 'package:func/func.dart';
import 'package:js/js.dart';

@JS()
external void autoInit();

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
  external static MDCIconToggle attachTo(Element surface);
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
  external static MDCRipple attachTo(Element surface);

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
