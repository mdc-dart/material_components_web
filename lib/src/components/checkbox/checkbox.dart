import 'dart:async';
import 'package:angular/angular.dart';

const Provider mdcCheckBoxValueAccessor = const Provider(
    NG_VALUE_ACCESSOR,
    useExisting: MdcCheckboxComponent,
    multi: true);

@Component(
    selector: 'mdc-checkbox',
    templateUrl: 'checkbox.html',
    providers: const [mdcCheckBoxValueAccessor],
    directives: const [COMMON_DIRECTIVES])
class MdcCheckboxComponent
    implements ControlValueAccessor<bool>, OnInit, OnDestroy {
  bool _disabled = false, _checked = false;
  StreamController _onTouched;

  StreamController<bool> _onChange;

  @Input()
  bool accent, primary;

  @Output()
  Stream<bool> get onChange => _onChange.stream;

  bool get disabled => _disabled;

  bool get checked => _checked;

  @Input()
  void set disabled(bool value) {
    _disabled = value == true;
  }

  @Input()
  void set checked(bool value) {
    _onChange.add(_checked = value == true);
  }

  @HostListener('click')
  void handleClick() {
    _onTouched.add(null);
    this.checked = !checked;
  }

  @override
  ngOnInit() {
    _onTouched = new StreamController();
    _onChange = new StreamController<bool>();
  }

  @override
  ngOnDestroy() {
    _onTouched.close();
    _onChange.close();
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
