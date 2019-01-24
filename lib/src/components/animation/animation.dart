import 'dart:html';
import 'package:angular/angular.dart';

@Directive(selector: '[mdc-animation]')
class MdcAnimationDirective implements OnInit, AfterViewInit {
  final HtmlElement element;

  String _animation = 'standard-curve';

  /// The duration of the animation, in milliseconds.
  ///
  /// Default: `250`.
  @Input()
  int duration = 250;

  MdcAnimationDirective(this.element);

  /// The [MdcAnimation] to display.
  ///
  /// Default: `standard-curve`
  String get animation => _animation;

  @Input('mdc-animation')
  set animation(String value) {
    if (value != null) {
      element.classes
        ..remove('mdc-animation-$_animation')
        ..add('mdc-animation-$value');
      _animation = value;
    }
  }

  @override
  ngOnInit() {
    this.animation = _animation ?? 'standard-curve';
  }

  @override
  ngAfterViewInit() {
    fadeIn();
  }

  /// Runs the animation.
  void fadeIn() {
    element.style.opacity = '1';
  }

  /// Runs the animation.
  void fadeOut() {
    element.style.opacity = '0';
  }
}
