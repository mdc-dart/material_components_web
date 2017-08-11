import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import '../../../mdc.dart';
import '../ripple/ripple.dart';

const Provider mdcIconToggleValueAccessor = const Provider(NG_VALUE_ACCESSOR,
    useExisting: MdcIconToggleComponent, multi: true);

/// MDC Icon Toggle provides a Material Design icon toggle button. It is fully accessible, and is designed to work with any icon set.
@Component(
    selector: 'mdc-icon-toggle',
    templateUrl: 'icon_toggle.html',
    directives: const [MdcRippleDirective],
    providers: const [mdcIconToggleValueAccessor])
class MdcIconToggleComponent
    implements ControlValueAccessor<bool>, OnInit, OnDestroy {
  final ElementRef _elementRef;
  final NgZone _zone;

  String _iconSet;
  bool _initialized = false, _disabled = false, _on = false;
  String _onIcon, _offIcon, _onLabel, _offLabel;
  StreamController _onTouched = new StreamController();
  StreamSubscription<Event> _sub;
  MDCIconToggle _toggle;

  StreamController<bool> _onChange = new StreamController<bool>();

  /// Style this component to feature the application's accent color.
  @Input()
  bool accent;

  /// Style this component to feature the application's primary color.
  @Input()
  bool primary;

  MdcIconToggleComponent(this._elementRef, this._zone);

  /// The icon to be shown when the toggle is 'on'.
  String get onIcon => _onIcon;

  /// The icon to be shown when the toggle is 'off'.
  String get offIcon => _offIcon;

  /// The label to be shown when the toggle is 'on'.
  String get onLabel => _onLabel;

  /// The label to be shown when the toggle is 'off'.
  String get offLabel => _offLabel;

  /// Fires whenever the status of the component changes.
  @Output()
  Stream<bool> get onChange => _onChange.stream;

  /// The icon set to use for this element, which defaults to `'material-icons'`.
  String get iconSet =>
      _iconSet?.isNotEmpty == true ? _iconSet : 'material-icons';

  /// The currently-visible icon.
  String get icon => on ? onIcon : offIcon;

  /// The currently-visible label.
  String get label => on ? onLabel : offLabel;

  bool get disabled => _disabled;

  /// The status of the icon toggle.
  bool get on => _on;

  @Input()
  void set onIcon(String value) {
    _onIcon = value;
    _update();
  }

  @Input()
  void set onLabel(String value) {
    _onLabel = value;
    _update();
  }

  @Input()
  void set offIcon(String value) {
    _offIcon = value;
    _update();
  }

  @Input()
  void set offLabel(String value) {
    _offLabel = value;
    _update();
  }

  @Input()
  void set iconSet(String value) {
    _iconSet = value;
    _update();
  }

  @Input()
  void set disabled(bool value) {
    _disabled = value == true;
  }

  @Input()
  void set on(bool value) {
    _onTouched.add(null);
    _onChange.add(_on = value == true);
    _toggle?.on = value == true;
  }

  void _handleEvent(CustomEvent e) {
    _zone.run(() {
      _onTouched.add(null);
      _onChange.add(_on = e.detail['isOn']);
    });
  }

  MDCIconToggle _init() {
    Element $el = _elementRef.nativeElement;
    var $i = $el.querySelector('i');
    var t = new MDCIconToggle($i);
    _sub = $i.on['MDCIconToggle:change'].listen(_handleEvent);
    return t;
  }

  void _update() {
    if (_initialized) {
      _sub?.cancel();
      _init();
    }
  }

  @override
  ngOnInit() {
    _toggle = _init();
    _initialized = true;
  }

  @override
  ngOnDestroy() {
    _onTouched.close();
    _onChange.close();
  }

  /// Computes a toggle object.
  ///
  /// Ex: `{"label":"Favorited","content":"favorite"}`
  String computeToggle(String icon, String label) {
    return '{"label":"$label","content":"$icon"}';
  }

  /// Toggles the state of this component.
  void toggle() {
    on = !on;
  }

  @override
  void registerOnChange(ChangeFunction<bool> f) {
    onChange.listen(f);
  }

  @override
  void registerOnTouched(TouchFunction f) {
    _onTouched.stream.listen((_) => f());
  }

  @override
  void writeValue(bool obj) {
    this.on = obj;
  }
}
