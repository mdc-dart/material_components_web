import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:angular2/src/common/forms/directives/control_value_accessor.dart';

const Provider MDC_CHECKBOX_TOGGLE_VALUE_ACCESSOR = const Provider(
    NG_VALUE_ACCESSOR,
    useExisting: MdcCheckboxToggleComponent,
    multi: true);

@Component(selector: 'mdc-checkbox', templateUrl: 'checkbox.html',
    // directives: const [MdcRippleDirective],
    providers: const [MDC_CHECKBOX_TOGGLE_VALUE_ACCESSOR])
class MdcCheckboxToggleComponent
    implements ControlValueAccessor<bool>, OnDestroy {
  bool _disabled = false, _checked = false;
  final StreamController _onTouched = new StreamController();

  @Input()
  bool accent, primary;

  @Output()
  final EventEmitter<bool> onChange = new EventEmitter<bool>();

  bool get disabled => _disabled;

  bool get checked => _checked;

  @Input()
  void set disabled(bool value) {
    _disabled = value == true;
  }

  @Input()
  void set checked(bool value) {
    onChange.add(_checked = value == true);
  }

  @HostListener('click')
  void handleClick() {
    _onTouched.add(null);
    this.checked = !checked;
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
    this.checked = obj;
  }
}
