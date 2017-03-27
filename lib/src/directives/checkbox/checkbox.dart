import 'package:angular2/angular2.dart';
import 'package:angular2/src/common/forms/directives/control_value_accessor.dart';

@Component(selector: 'mdc-checkbox', templateUrl: 'checkbox.html')
class MdcCheckboxComponent implements ControlValueAccessor<bool> {
  bool _checked;

  @Output()
  final EventEmitter<bool> checkedChanged = new EventEmitter();

  bool get checked => _checked;

  /// Same as [checked].
  bool get ngModel => checked;

  @Input()
  void set checked(bool value) {
    checkedChanged.add(_checked = value);
  }

  /// Same as [checked].
  @Input()
  void set ngModel(bool value) {
    checked = value;
  }

  @override
  void registerOnChange(ChangeFunction<bool> f) {
    checkedChanged.listen(f);
  }

  @override
  void registerOnTouched(TouchFunction f) {
    // Not implemented
  }

  @override
  void writeValue(bool obj) {
    _checked = obj;
  }
}
