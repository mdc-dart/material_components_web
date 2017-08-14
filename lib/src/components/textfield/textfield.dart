import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import '../../../mdc.dart';

@Component(
    selector: 'mdc-textfield',
    templateUrl: 'textfield.html',
    directives: const [
      COMMON_DIRECTIVES
    ],
    providers: const [
      const Provider(
        NG_VALUE_ACCESSOR,
        useExisting: MdcTextfieldComponent,
        multi: true,
      ),
    ])
class MdcTextfieldComponent
    implements ControlValueAccessor<String>, AfterViewInit, OnDestroy {
  final StreamController<KeyboardEvent> _onKeyPress =
      new StreamController<KeyboardEvent>();
  final StreamController<String> _valueChange =
      new StreamController<String>.broadcast();

  ChangeFunction<String> _changeListener;
  TouchFunction _touchListener;
  StreamSubscription<Event> _subBlur, _subInput;
  StreamSubscription<KeyboardEvent> _subKeyPress;
  String _value;

  /// The number of columns to show in a [multiLine] textfield.
  @Input()
  int cols;

  /// If `true` (default: `false`), then the textfield will be compacted and take up less space.
  @Input()
  bool dense = false;

  /// If `true` (default: `false`), then the value of this textfield cannot change.
  @Input()
  bool disabled = false;

  /// If `true` (default: `false`), then the textfield will fill up the entire width of its container.
  @Input()
  bool fullWidth = false;

  /// Display text below the textfield.
  @Input()
  String helpText;

  /// Display a hint to the user to aid them in filling out this field.
  @Input()
  String hintText;

  @ViewChild('input')
  ElementRef input;

  /// If `true` (default: `false`), then the textfield will show as multi-line.
  @Input()
  bool multiLine = false;

  /// If `true`, (default: `false`), the [helpText] will not fade away on blur.
  @Input()
  bool persistentHelpText = false;

  @ViewChild('root')
  ElementRef root;

  /// The number of rows to show in a [multiLine] textfield.
  @Input()
  int rows;

  @ViewChild('textarea')
  ElementRef textarea;

  @ViewChild('textareaRoot')
  ElementRef textareaRoot;

  /// The text currently displayed within the text field.
  String get value => _value;

  /// Fires whenever a key is pressed within the input element.
  @Output('keypress')
  Stream<KeyboardEvent> get onKeyPress => _onKeyPress.stream;

  /// Fires whenever the text within the textfield changes.
  @Output()
  Stream<String> get valueChange => _valueChange.stream;

  @Input()
  void set value(String v) {
    _setValueDirect(v);
    _valueChange.add(_value);
    DefaultValueAccessor a;
  }

  void _setValueDirect(String v) {
    if (disabled == true) return;
    _value = v ??= '';

    if (multiLine != true)
      input?.nativeElement?.value = v;
    else
      textarea?.nativeElement?.value = v;
  }

  void _handleInput(e) {
    if (disabled == true) return;
    _valueChange.add(_value = e.target.value);
    if (_changeListener != null) _changeListener(_value);
  }

  @override
  ngAfterViewInit() {
    _subBlur?.cancel();
    _subInput?.cancel();
    _subKeyPress?.cancel();

    ElementRef targetRoot;
    ElementRef targetInput;

    if (multiLine != true) {
      targetRoot = root;
      targetInput = input;
    } else {
      targetRoot = textareaRoot;
      targetInput = textarea;
    }

    var $input = targetInput.nativeElement;
    $input.value = _value ??= '';

    _subBlur = $input.onBlur.listen((_) {
      if (_touchListener != null) _touchListener();
    });
    _subInput = $input.onInput.listen(_handleInput);
    _subKeyPress = $input.onKeyPress.listen(_onKeyPress.add);

    MDCTextfield.attachTo(targetRoot.nativeElement);
  }

  @override
  ngOnDestroy() {
    _subInput?.cancel();
    _subKeyPress?.cancel();
    _onKeyPress.close();
    _valueChange.close();
  }

  @override
  void registerOnChange(ChangeFunction<String> f) {
    _changeListener = f;
    _changeListener(_value ??= '');
  }

  @override
  void registerOnTouched(TouchFunction f) {
    _touchListener = f;
  }

  @override
  void writeValue(String obj) {
    _setValueDirect(obj);
  }
}
