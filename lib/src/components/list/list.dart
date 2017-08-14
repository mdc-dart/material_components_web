import 'dart:async';
import 'package:angular/angular.dart';
import '../ripple/ripple.dart';

const List<Type> mdcListDirectives = const [
  MdcListComponent,
  MdcListItemComponent,
  MdcListItemDetailComponent,
  MdcListDividerComponent
];

/// MDC List provides styles which implement Material Design Lists - "A single continuous column of tessellated subdivisions of equal width." Both single-line and two-line lists are supported (with three-line lists coming soon).
///
/// MDC Lists are designed to be accessible and RTL aware.
@Component(
    selector: 'mdc-list',
    directives: const [COMMON_DIRECTIVES],
    template: '''
<h3 *ngIf="label?.isNotEmpty == true" class="mdc-list-group__subheader">{{label}}</h3>
<ul [class.bordered]="bordered" [class.mdc-list--avatar-list]="avatar" [class.mdc-list__dense]="dense" [class.mdc-list--two-line]="twoLine" class="mdc-list">
  <ng-content></ng-content>
</ul>''',
    styles: const [
      '''
.bordered {
    padding-left: 0;
    padding-right: 0;
}

.bordered /deep/ mdc-list-item:not(:first-child) .bordered {
  border-top: none !important;
}
  '''
    ])
class MdcListComponent implements AfterContentInit, OnDestroy {
  bool _bordered = false;
  StreamSubscription<Iterable<MdcListItemComponent>> _sub;

  /// Display the start details of [items] as avatars.
  @Input()
  bool avatar = false;

  /// Lists can be made more compact by using the mdc-list--dense modifier class.
  @Input()
  bool dense = false;

  /// Set this to display a subheader above the list.
  @Input()
  String label;

  /// While in theory you can add any number of "lines" to a list item, you can use the mdc-list--two-line combined with some extra markup around the text to style a list in the two-line list style as defined by the spec (see "Two-line lists").
  @Input()
  bool twoLine = false;

  @ContentChildren(MdcListItemComponent)
  QueryList<MdcListItemComponent> items;

  /// Display a border around all [items] in this list.
  bool get bordered => _bordered;

  void _applyBorder(MdcListItemComponent item) {
    item.bordered = _bordered == true;
  }

  @Input()
  void set bordered(bool value) {
    _bordered = value;
    items?.forEach(_applyBorder);
  }

  @override
  ngAfterContentInit() {
    _sub = items.changes.listen((it) {
      it.forEach(_applyBorder);
    });

    for (var item in items) {
      _applyBorder(item);
    }
  }

  @override
  ngOnDestroy() {
    _sub.cancel();
  }
}

/// An item within an [MdcListComponent].
@Component(
    selector: 'mdc-list-item',
    directives: const [COMMON_DIRECTIVES, MdcRippleDirective],
    template: '''
<a [class.bordered]="bordered" [href]="href" class="mdc-list-item" mdc-ripple>
    <ng-content></ng-content>
</a>
''',
    styles: const [
      '''
  .bordered {
    padding: 0 16px;
    border: 1px solid rgba(0, 0, 0, .12);
  }
  '''
    ])
class MdcListItemComponent {
  /// Typically, this is set by a parent [MdcListComponent].
  ///
  /// If `true` (default: `false`), then a border will be drawn around this item.
  @Input()
  bool bordered = false;

  /// Provide an `href` to render the list item as an `<a>` element.
  @Input()
  String href;
}

@Component(
    selector: 'mdc-list-item-detail',
    templateUrl: 'list_detail.html',
    directives: const [
      COMMON_DIRECTIVES
    ],
    styles: const [
      '''
:host {
    display: inline-flex;
}

:host[end] {
    margin-left: auto;
}
  '''
    ])
class MdcListItemDetailComponent {
  /// Alternate text for when the [image] fails to load.
  @Input()
  String alt;

  /// Show this detail at the end of a list item, rather than the start.
  @Input()
  bool end = false;

  /// Sets the content to a given icon.
  @Input()
  String icon;

  /// The iconset to use to render the [icon]. Defauult: `material-icons`.
  @Input()
  String iconSet = 'material-icons';

  /// Sets the content to an image at the given URL.
  @Input()
  String image;

  /// A pixel width for the displayed [image].
  @Input()
  int width;

  /// A pixel height for the displayed [image].
  @Input()
  int height;

  /// Computes a CSS class for this item, starting with `mdc-list-item__` and ending with `-detail`.
  String get cssClass =>
      end == true ? 'mdc-list-item__end-detail' : 'mdc-list-item__start-detail';
}

/// MDC List contains an mdc-list-divider classes which can be used as full-width or inset subdivisions either within lists themselves, or event standalone between related groups of content.
@Component(
    selector: 'mdc-list-divider',
    template: '''
<hr [class.mdc-list-divider--inset]="inset" role="separator" class="mdc-list-divider">
''')
class MdcListDividerComponent {
  /// In order to make separators inset, add a mdc-list-divider--inset modifier class to it.
  ///
  /// Inset dividers are useful when working with lists which have start details.
  @Input()
  bool inset = false;
}
