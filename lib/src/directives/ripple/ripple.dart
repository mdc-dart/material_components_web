import 'dart:html';
import 'package:angular2/angular2.dart';
import '../../mdc.dart';

@Directive(selector: '[mdc-ripple]')
class MdcRippleDirective implements OnInit {
  final ElementRef _elementRef;
  MDCRipple _ripple;
  bool rippleEnabled = true;

  MdcRippleDirective(this._elementRef);

  Element get $surface => _elementRef.nativeElement;

  void activate() {
    if (rippleEnabled != false) {
      _ripple.activate();
    }
  }

  @override
  ngOnInit() {
    window.console.info(_ripple = new MDCRipple($surface));

    $surface.onClick.listen((_) {
      activate();
    });
  }
}
