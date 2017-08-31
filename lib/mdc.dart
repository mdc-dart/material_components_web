@JS('mdc')
library mdc;

import 'dart:html';
import 'package:func/func.dart';
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

@JS('select.MDCSelect')
abstract class MDCSelect {
  @JS()
  external factory MDCSelect(Element surface);

  @JS()
  external List<Element> get options;

  @JS()
  external int get selectedIndex;

  @JS()
  external List<Element> get selectedOptions;

  @JS()
  external String get value;

  @JS()
  external void set value(String v);

  @JS()
  external void listen(String eventName, VoidFunc1<Event> callback);
}

@JS('snackbar.MDCSnackbar')
abstract class MDCSnackbar {
  @JS()
  external factory MDCSnackbar(Element surface);

  @JS()
  external void show(MDCSnackbarOptions options);
}

@JS()
@anonymous
abstract class MDCSnackbarOptions {
  @JS()
  external factory MDCSnackbarOptions(
      {String message,
      int timeout,
      VoidFunc0 actionHandler,
      String actionText,
      bool multiline,
      bool dismissOnAction,
      bool actionOnBottom});

  @JS()
  external String get message;

  @JS()
  external void set message(String v);

  @JS()
  external int get timeout;

  @JS()
  external void set timeout(int v);

  @JS()
  external VoidFunc0 get actionHandler;

  @JS()
  external void set actionHandler(VoidFunc0 v);

  @JS()
  external String get actionText;

  @JS()
  external void set actionText(String v);

  @JS()
  external bool get multiline;

  @JS()
  external void set multiline(bool v);

  @JS()
  external bool get dismissOnAction;

  @JS()
  external void set dismissOnAction(bool v);

  @JS()
  external bool get actionOnBottom;

  @JS()
  external void set actionOnBottom(bool v);
}

@JS('textfield.MDCTextfield')
abstract class MDCTextfield {
  @JS()
  external factory MDCTextfield(Element surface);

  @JS()
  external static void attachTo(Element surface);
}
