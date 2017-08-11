import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import '../../../mdc.dart';

const List<Type> mdcDialogDirectives = const [
  MdcDialogComponent,
  MdcDialogTitleComponent
];

@Component(
    selector: 'mdc-dialog',
    templateUrl: 'dialog.html',
    directives: const [COMMON_DIRECTIVES])
class MdcDialogComponent implements OnInit, OnDestroy {
  final ElementRef _elementRef;
  final NgZone _zone;

  MDCDialog _dialog;
  bool _open = false;

  StreamController _accept = new StreamController(),
      _cancel = new StreamController();
  StreamController<bool> _openChange = new StreamController<bool>();

  /// If `false` (default: `true`), then no header will be shown.
  @Input()
  bool showHeader = true;

  /// If `false` (default: `true`), then no footer will be shown.
  @Input()
  bool showFooter = true;

  /// If `false` (default), then a default footer with 'OK' and 'Cancel' buttons will be shown.
  @Input()
  bool showDefaultFooter = false;

  /// Some dialogs will not be tall enough to accomodate everything you would like to display in them. For this there is a mdc-dialog__body--scrollable modifier to allow scrolling in the dialog.
  @Input()
  bool scrollable = false;

  MdcDialogComponent(this._elementRef, this._zone);

  /// Fires when the dialog is accepted. Typically only works when [showDefaultFooter] is `true`.
  @Output()
  Stream get accept => _accept.stream;

  /// Fires when the dialog is declined. Typically only works when [showDefaultFooter] is `true`.
  @Output()
  Stream get cancel => _cancel.stream;

  /// Whether or not the dialog is currently visible on the screen.
  bool get open => _dialog?.open == true;

  /// Fires when the status of the dialog ([open]/closed) is changed.
  @Output()
  Stream<bool> get openChange => _openChange.stream;

  @Input()
  void set open(bool value) {
    if (_dialog != null) {
      _openChange.add(_dialog.open = value == true);
    } else
      _open = true;
  }

  @override
  ngOnInit() {
    Element $el = _elementRef.nativeElement;
    var $surface = $el.querySelector('.mdc-dialog');
    _dialog = new MDCDialog($surface);

    $surface
      ..on['MDCDialog:accept'].listen((_) {
        _zone.run(() => _accept.add(null));
      })
      ..on['MDCDialog:cancel'].listen((_) {
        _zone.run(() => _cancel.add(null));
      });

    if (_open) _dialog.show();
    _open = null;
  }

  @override
  ngOnDestroy() {
    _accept.close();
    _cancel.close();
    _openChange.close();
  }

  /// Opens the dialog. You can optionally provide a [focusTarget].
  void show([EventTarget focusTarget]) {
    if (_dialog != null) {
      _dialog.lastFocusedTarget = focusTarget ?? _elementRef.nativeElement;
      _dialog.show();
      _openChange.add(_dialog.open);
    }
  }

  /// Closes the dialog.
  void close() {
    if (_dialog != null) {
      _dialog.close();
      _openChange.add(_dialog.open);
    }
  }
}

/// The title of an MDC dialog.
@Component(
    selector: 'mdc-dialog-title',
    template:
        '<h2 class="mdc-dialog__header__title"><ng-content></ng-content></h2>')
class MdcDialogTitleComponent {}
