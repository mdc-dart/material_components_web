@JS('mdc')
library mdc;

import 'dart:html';
import "package:js/js.dart";

@JS()
external autoInit();

@JS('ripple.MDCRipple')
abstract class MDCRipple {
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
abstract class MDCRippleFoundation {}
