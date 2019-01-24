import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import '../../../mdc.dart';

/// Displays a drawer to the side of regular content.
///
/// This drawer can be toggled on/off to open/close it.
@Component(selector: 'mdc-drawer', templateUrl: 'drawer.html', directives: [
  coreDirectives
], styles: [
  '''
.header-content {
    background-color: var(--mdc-theme-primary);
    color: var(--mdc-theme-text-primary-on-primary);
}
  '''
])
class MdcDrawerComponent implements AfterViewInit, OnDestroy {
  final StreamController<bool> _openChange = new StreamController<bool>();

  bool _open = false, _persistent = false;
  MDCDynamicDrawer _drawer;
  StreamSubscription<Event> _onOpen, _onClose;

  @ViewChild('aside')
  HtmlElement aside;

  /// Show a header in the drawer, often used for user selection.
  @Input()
  bool showHeader;

  /// Show a spacer element, which positions this element above a toolbar.
  @Input()
  bool toolbarSpacer;

  /// Computes a CSS class used to render the drawer.
  String get cssClass =>
      persistent == true ? 'mdc-persistent-drawer' : 'mdc-temporary-drawer';

  /// `true` if the drawer is currently open; otherwise, `false`.
  bool get open => _drawer?.open ?? _open;

  /// Persistent drawers can be toggled open or closed.
  ///
  /// The drawer sits on the same surface elevation as the content.
  /// It is closed by default. When the drawer is outside of the page grid and opens, the drawer forces other content to change size and adapt to the smaller viewport.
  /// Persistent drawers stay open until closed by the user.
  bool get persistent => _persistent;

  /// Fires when the drawer is opened or closed.
  @Output()
  Stream<bool> get openChange => _openChange.stream;

  @Input()
  set open(bool value) {
    _open = value == true;
    _drawer?.open = _open;
  }

  @Input()
  set persistent(bool value) {
    _persistent = value == true;

    if (_drawer != null) {
      _onOpen?.cancel();
      _onClose?.cancel();
      ngAfterViewInit();
    }
  }

  @override
  ngAfterViewInit() {
    _drawer = persistent
        ? new MDCPersistentDrawer(aside)
        : new MDCTemporaryDrawer(aside);

    _onOpen = aside.on['MDCPersistentDrawer:open'].listen((_) {
      _openChange.add(_open = true);
    });

    _onClose = aside.on['MDCPersistentDrawer:close'].listen((_) {
      _openChange.add(_open = true);
    });
  }

  @override
  ngOnDestroy() {
    _openChange.close();
  }

  /// Opens the drawer.
  void show() {
    _drawer?.open = true;
  }

  /// Closes the drawer.
  void close() {
    _drawer?.open = false;
  }
}
