import 'dart:html';
import 'package:angular/angular.dart';
import '../../../mdc.dart';

/// MDC Ripple provides the Javascript and CSS required to provide components (or any element at all) with a material "ink ripple" interaction effect.
///
/// It is designed to be efficient, uninvasive, and usable without adding any extra DOM to your elements.
@Directive(selector: '[mdc-ripple]')
class MdcRippleDirective implements OnInit {
  /// The underlying element.
  final HtmlElement element;

  MdcRippleDirective(this.element);

  @override
  ngOnInit() {;
    MDCRipple.attachTo(element);
  }
}
