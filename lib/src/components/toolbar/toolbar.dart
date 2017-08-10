import 'package:angular/angular.dart';

const List<Type> mdcToolbarDirectives = const [
  MdcToolbarComponent,
  MdcToolbarSectionComponent,
  MdcToolbarTitleComponent
];

/// MDC Toolbar provides a RTL-aware Material Design toolbar component adhering to the Material Design toolbar spec.
/// Toolbars scroll with content by default, but supports fixed on top as well.
@Component(
    selector: 'mdc-toolbar',
    templateUrl: 'toolbar.html',
    styleUrls: const ['toolbar.css'])
class MdcToolbarComponent {
  /// If `true` (default), the toolbar's text will be unselectable.
  @Input()
  bool disableSelection = true;

  /// If `true`, the toolbar will remain fixed to the top of the screen.
  @Input()
  bool fixed;

  @Input()
  String title;
}

/// Toolbar sections are aligned to the toolbar's center.
/// You can change this behavior by setting [alignStart] or [alignEnd] to align the sections to the start or the end of the toolbar (respectively).
@Component(selector: 'mdc-toolbar-section', templateUrl: 'toolbar_section.html')
class MdcToolbarSectionComponent {
  @Input()
  bool alignStart, alignEnd;
}

/// You can use the [MdcToolbarTitleComponent] to style toolbar text representing a page's title, or an application name.
@Component(selector: 'mdc-toolbar-title', templateUrl: 'toolbar_title.html')
class MdcToolbarTitleComponent {
  @Input()
  String title;
}
