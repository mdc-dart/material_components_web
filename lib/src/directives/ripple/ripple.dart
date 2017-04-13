import 'dart:async';
import 'dart:html';
import 'package:angular2/angular2.dart';
import '../../mdc.dart';

@Directive(selector: '[mdc-ripple]')
class MdcRippleDirective implements OnInit {
  final ElementRef _elementRef;
  // static final Duration _fadeDuration = new Duration(milliseconds: 250);

  MDCRipple _ripple;
  Element _surface;
  bool _accent = false, _primary = false, _unbounded = false;

  bool get accent => _accent;

  bool get primary => _primary;

  bool get unbounded => _unbounded;

  @Input()
  void set accent(bool value) {
    _accent = value == true;
    if (_accent && !$surface.classes.contains('mdc-ripple-surface--accent'))
      $surface.classes.add('mdc-ripple-surface--accent');
    else
      $surface.classes.remove('mdc-ripple-surface--accent');
  }


  @Input()
  void set primary(bool value) {
    _primary = value == true;
    if (_primary && !$surface.classes.contains('mdc-ripple-surface--primary'))
      $surface.classes.add('mdc-ripple-surface--primary');
    else
      $surface.classes.remove('mdc-ripple-surface--primary');
  }

  @Input()
  void set unbounded(bool value) {
    _ripple?.unbounded = value == true;
  }

  MdcRippleDirective(this._elementRef);

  Element get $surface {
    if (_surface != null) return _surface;

    var $el = _elementRef.nativeElement as Element;

    if ($el.attributes.containsKey('mdc-ripple-selector'))
      $el = $el.querySelector($el.attributes['mdc-ripple-selector']) ?? $el;

    if (!$el.classes.contains('mdc-ripple-surface'))
      $el.classes.add('mdc-ripple-surface');

    return _surface = $el;
  }

  MDCRipple _initRipple() {
    if (_ripple == null) {
      return _ripple = new MDCRipple($surface)..unbounded = _unbounded == true;
    } else
      return _ripple;
  }

  @HostListener('mousedown')
  void handleMouseDown() {
    _initRipple().activate();
  }

  @HostListener('mouseup')
  void handleMouseUp() {
    _initRipple().deactivate();
    $surface.blur();
  }

  @override
  ngOnInit() {
    this.accent = _accent;
    this.primary = _primary;
    new Timer.periodic(new Duration(milliseconds: 250), (Timer timer) {
      var pos = $surface.getComputedStyle().position;
      if (pos == 'relative') {
        _initRipple();
        timer.cancel();
      }
    });
  }
}
