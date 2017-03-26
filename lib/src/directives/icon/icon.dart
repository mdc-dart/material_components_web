import 'dart:html';
import 'package:angular2/angular2.dart';

/// Creates an icon, namely a Material Design icon.
///
/// Ensure that any required font stylesheets have been imported
/// to use this component.
///
/// ## Example
///
/// ```html
/// <mdc-icon icon="menu"></mdc-icon>
/// <mdc-icon iconSet="foo" icon="bar"></mdc-icon>
/// ```
@Component(selector: 'mdc-icon', templateUrl: 'icon.html')
class MdcIconComponent {
  String _iconSet;
  final ElementRef _elementRef;

  /// The name of the icon to use. If you are using `material-icons`, then
  /// this corresponds to a font ligature.
  @Input()
  String icon;

  MdcIconComponent(this._elementRef);

  /// The icon set to use for this element, which defaults to `'material-icons'`.
  String get iconSet =>
      _iconSet?.isNotEmpty == true ? _iconSet : 'material-icons';

  @Input()
  void set iconSet(String value) {
    _iconSet = value;
    var $el = _elementRef.nativeElement as Element;
    $el.attributes['class'] = this.iconSet;
  }
}
