@JS('mdc')
library mdc;

import 'dart:html';
import 'package:js/js.dart';

@JS()
external void autoInit();

@JS()
abstract class MDCAnimationStatic {
  @JS()
  external String getCorrectName(Element element, String eventName);
}

@JS('checkbox.MDCCheckbox')
abstract class MDCCheckbox {
  @JS()
  external factory MDCCheckbox(Element surface);
  
  @JS()
  external bool get checked;
  
  @JS()
  external void set checked(bool value);
  
  @JS()
  external bool get disabled;
  
  @JS()
  external void set disabled(bool value);
  
  @JS()
  external bool get indeterminate;
  
  @JS()
  external void set indeterminate(bool value);

  @JS()
  external String get value;

  @JS()
  external void set value(String v);
}

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

@JS('textfield.MDCTextfield')
abstract class MDCTextfield {
  @JS()
  external factory MDCTextfield(Element surface);

  @JS()
  external static void attachTo(Element surface);
}