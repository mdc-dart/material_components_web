import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import '../../../mdc.dart';
import 'package:js/js.dart';

/// The MDC Snackbar component is a spec-aligned snackbar/toast component adhering to the Material Design snackbars & toasts requirements.
@Component(selector: 'mdc-snackbar', templateUrl: 'snackbar.html')
class MdcSnackbarComponent implements AfterContentInit, OnDestroy {
  final StreamController _action = new StreamController();
  MDCSnackbar _snackbar;

  @ViewChild('surface')
  HtmlElement surface;

  /// Whether to show the action below the multiple lines of text.
  @Input()
  bool actionOnBottom;

  /// The text to display for the action button.
  @Input()
  String actionText;

  /// By default the snackbar will be dimissed when the user presses the action button.
  ///
  /// If you want the snackbar to remain visible until the timeout is reached (regardless of whether the user pressed the action button or not) you can set the dismissesOnAction property to false.
  @Input()
  bool dismissOnAction;

  /// The text message to display.
  @Input()
  String message;

  /// Whether to show the snackbar with space for multiple lines of text.
  @Input()
  bool multiline;

  /// The amount of time in milliseconds to show the snackbar.
  ///
  /// Default: `2750`
  @Input()
  int timeout;

  /// Fires whenever the user presses the action button.
  @Output()
  Stream get action => _action.stream;

  @override
  ngAfterContentInit() {
    _snackbar = new MDCSnackbar(surface);
  }

  @override
  ngOnDestroy() {
    _action.close();
  }

  /// Opens the snackbar.
  void show() {
    _snackbar.show(new MDCSnackbarOptions(
      message: message,
      timeout: timeout,
      multiline: multiline,
      actionOnBottom: actionOnBottom,
      actionText: actionText,
      dismissOnAction: dismissOnAction,
      actionHandler: allowInterop(() {
        _action.add(null);
      }),
    ));
  }
}
