import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart'
    hide
    NG_VALUE_ACCESSOR,
    ChangeFunction,
    ControlValueAccessor,
    DefaultValueAccessor,
    TouchFunction;
import 'package:angular_forms/angular_forms.dart';
import '../../../mdc.dart';

/// The MDC Checkbox component is a spec-aligned checkbox component adhering to the Material Design checkbox requirements.
///
/// It works without JavaScript with basic functionality for all states.
/// If you use the JavaScript object for a checkbox, it will add more intricate animation effects when switching between states.
@Component(
    selector: 'mdc-checkbox',
    templateUrl: 'checkbox.html',
    providers: const [
      const Provider(
        NG_VALUE_ACCESSOR,
        useExisting: MdcCheckboxComponent,
        multi: true,
      )
    ],
    directives: const [
      COMMON_DIRECTIVES
    ])
class MdcCheckboxComponent
    implements ControlValueAccessor<bool>, AfterViewInit, OnDestroy {
  final StreamController<bool> _onChange =
      new StreamController<bool>.broadcast();
  final StreamController _onTouched = new StreamController.broadcast();

  MDCCheckbox _checkbox;
  bool _checked = false, _disabled = false, _indeterminate = false;
  StreamSubscription<Event> _subBlur, _subInput;

  @Input()
  bool accent, primary;

  @ViewChild('checkbox')
  ElementRef checkbox;

  /// Sets a label to be positioned next to this checkbox.
  @Input()
  String label;

  @ViewChild('root')
  ElementRef root;

  @Output()
  Stream<bool> get onChange => _onChange.stream;

  /// Returns `true` if the checkbox is checked.
  bool get checked => _checked;

  /// If `true` (default: `false`), then users will be unable to interact with this component.
  bool get disabled => _disabled;

  /// Returns `true` if the checkbox is in an indeterminate state and exists in three options.
  bool get indeterminate => _indeterminate;

  @Input()
  void set checked(bool value) {
    if (_disabled == true) return;
    _checked = value == true;
    _checkbox?.checked = _checked;
    _onChange.add(_checked);
  }

  @Input()
  void set disabled(bool value) {
    _checkbox.disabled = _disabled = value == true;
  }

  @Input()
  void set indeterminate(bool value) {
    _checkbox.indeterminate = _indeterminate = value == true;
  }

  @override
  ngAfterViewInit() {
    _subBlur?.cancel();
    _subInput?.cancel();
    _checkbox = new MDCCheckbox(root.nativeElement);
    CheckboxInputElement $checkbox = checkbox.nativeElement;

    _subBlur = $checkbox.onBlur.listen(_onTouched.add);
    _subInput = $checkbox.onChange.listen((_) {
      _onChange.add($checkbox.checked);
    });
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
