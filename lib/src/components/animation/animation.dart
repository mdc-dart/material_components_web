import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';

@Directive(selector: '[mdc-animation]')
class MdcAnimationDirective implements OnInit, AfterViewInit {
  final ElementRef _elementRef;

  String _animation = 'standard-curve';

  /// The duration of the animation, in milliseconds.
  ///
  /// Default: `250`.
  @Input()
  int duration = 250;

  MdcAnimationDirective(this._elementRef);

  Element get _$el => _elementRef.nativeElement;

  /// The [MdcAnimation] to display.
  ///
  /// Default: `standard-curve`
  String get animation => _animation;

  @Input('mdc-animation')
  void set animation(String value) {
    if (value != null) {
      _$el.classes
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
    _$el.style.opacity = '1';
  }

  /// Runs the animation.
  void fadeOut() {
    _$el.style.opacity = '0';
  }
}
