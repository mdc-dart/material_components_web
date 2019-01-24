import 'dart:html';
import 'package:angular/angular.dart';

@Directive(selector: '[mdc-elevation]')
class MdcElevationDirective implements OnInit {
  /// The underlying element.
  final HtmlElement element;
  
  bool _transition = false;
  int _elevation;

  int get elevation => _elevation;

  MdcElevationDirective(this.element);

  Element get surface {
    if (element.attributes.containsKey('mdc-elevation-selector')) {
      return element
              .querySelector(element.attributes['mdc-elevation-selector']) ??
          element;
    }

    return element;
  }

  @Input('mdc-elevation')
  set elevation(int value) {
    if (_elevation == null || value != _elevation) {
      if (!_transition) {
        surface.classes.add('mdc-elevation-transition');
        _transition = true;
      }

      if (value != null && value > 0)
        surface.classes.add('mdc-elevation--z${_elevation = value}');
      else
        surface.classes
          ..remove('mdc-elevation-transition')
          ..remove('mdc-elevation--z$_elevation');
    }
  }

  @override
  ngOnInit() {
    if (_elevation != null) {
      this.elevation = _elevation;
    } else if (surface.attributes.containsKey('mdc-elevation')) {
      try {
        var n = int.parse(surface.attributes['mdc-elevation']);
        this.elevation = n;
      } catch (e) {}
    }
  }
}
