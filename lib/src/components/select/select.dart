import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import '../../../mdc.dart';
import 'package:js/js.dart';

/// MDC Select provides Material Design single-option and multi-option select menus.
///
/// It functions analogously to the browser's native <select> element, and includes a gracefully degraded version that can be used in conjunction with the browser's native element.
/// Both are fully accessible, and fully RTL-aware.
@Component(
  selector: 'mdc-select',
  templateUrl: 'select.html',
  providers: [
    Provider(
      ngValueAccessor,
      useExisting: MdcSelectComponent,
      multi: true,
    ),
  ],
  styles: [
    '''
  :host /deep/ .mdc-select__menu {
    top: inherit !important;
    left: inherit !important;
  }
  '''
  ],
)
class MdcSelectComponent
    implements AfterContentInit, ControlValueAccessor<String>, OnDestroy {
  final StreamController<String> _valueChange =
      new StreamController<String>.broadcast();
  final StreamController _touch = new StreamController.broadcast();
  final HtmlElement _element;

  MDCSelect _select;
  StreamSubscription<Event> _sub;
  String _value;

  MdcSelectComponent(this._element);

  /// The text to be displayed when no option is currently selected.
  @Input()
  String defaultText;

  /// If `true` (default: `false`), then the user will not be able to interact
  /// with this component.
  @Input()
  bool disabled = false;

  @override
  void onDisabledChanged(bool isDisabled) {
    disabled = isDisabled;
  }

  /// Gets or sets the value of the component.
  String get value =>
      _select?.selectedOptions[_select.selectedIndex]?.text ?? _value;

  @Output()
  Stream<String> get valueChange => _valueChange.stream;

  set value(String v) {
    _value = v;

    if (_select != null) {
      _touch.add(null);
      _valueChange.add(_select.value = _value);
    } else {
      _valueChange.add(_value);
    }
  }

  void _handleChange(Event e) {
    _touch.add(null);
    _valueChange.add(_value = _select.value);
  }

  @override
  ngAfterContentInit() {
    _sub?.cancel();
    _select = new MDCSelect(_element)..value = _value;
    _select.listen('MDCSelect:change', allowInterop(_handleChange));
  }

  @override
  ngOnDestroy() {
    _touch.close();
    _valueChange.close();
    _sub?.cancel();
  }

  @override
  void registerOnTouched(TouchFunction f) {
    _touch.stream.listen((_) => f());
  }

  @override
  void registerOnChange(ChangeFunction<String> f) {
    _valueChange.stream.listen(f);
  }

  @override
  void writeValue(String obj) {
    this.value = obj;
  }
}
