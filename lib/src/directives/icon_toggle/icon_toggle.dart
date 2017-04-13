import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:angular2/src/common/forms/directives/control_value_accessor.dart';
import '../ripple/ripple.dart';

const Provider MDC_ICON_TOGGLE_VALUE_ACCESSOR = const Provider(
    NG_VALUE_ACCESSOR,
    useExisting: MdcIconToggleComponent,
    multi: true);

@Component(
    selector: 'mdc-icon-toggle',
    templateUrl: 'icon_toggle.html',
    directives: const [MdcRippleDirective],
    providers: const [MDC_ICON_TOGGLE_VALUE_ACCESSOR])
class MdcIconToggleComponent implements ControlValueAccessor<bool>, OnDestroy {
  String _iconSet;
  bool _disabled = false, _on = false;
  final StreamController _onTouched = new StreamController();

  @Input()
  bool accent, primary;

  @Input()
  String onIcon, offIcon, onLabel, offLabel;

  @Output()
  final EventEmitter<bool> onChange = new EventEmitter<bool>();

  /// The icon set to use for this element, which defaults to `'material-icons'`.
  String get iconSet =>
      _iconSet?.isNotEmpty == true ? _iconSet : 'material-icons';

  @Input()
  void set iconSet(String value) {
    _iconSet = value;
  }

  String get icon => on ? onIcon : offIcon;
  String get label => on ? onLabel : offLabel;

  bool get disabled => _disabled;

  bool get on => _on;

  @Input()
  void set disabled(bool value) {
    _disabled = value == true;
  }

  @Input()
  void set on(bool value) {
    onChange.add(_on = value == true);
  }

  @HostListener('click')
  void handleClick() {
    _onTouched.add(null);
    this.on = !on;
  }

  @override
  ngOnDestroy() {
    _onTouched.close();
    onChange.close();
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
