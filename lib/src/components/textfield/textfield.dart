import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import '../../../mdc.dart';

@Component(
  selector: 'mdc-textfield',
  templateUrl: 'textfield.html',
  directives: const [coreDirectives],
  providers: [
    Provider(
      ngValueAccessor,
      useExisting: MdcTextfieldComponent,
      multi: true,
    ),
  ],
)
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

  @override
  void onDisabledChanged(bool isDisabled) {
    disabled = isDisabled;
  }

  /// If `true` (default: `false`), then the textfield will fill up the entire width of its container.
  @Input()
  bool fullWidth = false;

  /// Display text below the textfield.
  @Input()
  String helpText;

  /// Display a hint to the user to aid them in filling out this field.
  @Input()
  String hintText;

  /// Render this textfield as though it were invalid. Works well with validators.
  @Input()
  bool invalid;

  @ViewChild('input')
  TextInputElement input;

  /// The minimum length of text in this component.
  @Input()
  int minlength;

  /// The maximum length of text in this component.
  @Input()
  int maxlength;

  /// If `true` (default: `false`), then the textfield will show as multi-line.
  @Input()
  bool multiLine = false;

  /// A validation pattern to validate input against.
  @Input()
  String pattern;

  /// If `true`, (default: `false`), the [helpText] will not fade away on blur.
  @Input()
  bool persistentHelpText = false;

  /// Whether the textfield is required.
  @Input()
  bool required = false;

  @ViewChild('root')
  HtmlElement root;

  /// The number of rows to show in a [multiLine] textfield.
  @Input()
  int rows;

  @ViewChild('textarea')
  TextAreaElement textarea;

  @ViewChild('textareaRoot')
  HtmlElement textareaRoot;

  /// The `type` attribute to be placed on the underlying `input` element.
  @Input()
  String type = 'text';

  /// Fires whenever a key is pressed within the input element.
  @Output('keypress')
  Stream<KeyboardEvent> get onKeyPress => _onKeyPress.stream;

  /// Whether the textfield is valid.
  bool get valid {
    return input?.validity?.valid ?? textarea?.validity?.valid ?? false;
  }

  /// The text currently displayed within the text field.
  String get value => _value;

  /// Fires whenever the text within the textfield changes.
  @Output()
  Stream<String> get valueChange => _valueChange.stream;

  @Input()
  set value(String v) {
    _setValueDirect(v);
    _valueChange.add(_value);
  }

  void _setValueDirect(String v) {
    if (disabled == true) return;
    _value = v ??= '';

    if (multiLine != true)
      input?.value = v;
    else
      textarea?.value = v;
  }

  void _handleInput(Event e) {
    var target = e.target;
    if (disabled == true) return;

    if (target is InputElement) {
      _valueChange.add(_value = target.value);

      if (_changeListener != null) _changeListener(_value);

      if (!target.validity.valid) {
        helpText ??= target.validationMessage;
      }
    } else if (target is TextAreaElement) {
      _valueChange.add(_value = target.value);

      if (_changeListener != null) _changeListener(_value);

      if (!target.validity.valid) {
        helpText ??= target.validationMessage;
      }
    }
  }

  @override
  ngAfterViewInit() {
    _subBlur?.cancel();
    _subInput?.cancel();
    _subKeyPress?.cancel();

    Element targetRoot;
    String validationMessage;
    Stream<Event> onBlur, onInput;
    Stream<KeyboardEvent> onKeyPress;
    bool isValid;

    if (multiLine != true) {
      targetRoot = root;
      input.value = _value ?? '';
      validationMessage = input.validationMessage;
      onBlur = input.onBlur;
      onKeyPress = input.onKeyPress;
      onInput = input.onInput;
      isValid = input.validity.valid;
    } else {
      targetRoot = textareaRoot;
      textarea.value = _value ?? '';
      validationMessage = textarea.validationMessage;
      onBlur = textarea.onBlur;
      onKeyPress = textarea.onKeyPress;
      onInput = textarea.onInput;
      isValid = textarea.validity.valid;
    }

    if (!isValid) {
      helpText ??= validationMessage;
    }

    _subBlur = onBlur.listen((_) {
      if (_touchListener != null) _touchListener();
    });
    _subInput = onInput.listen(_handleInput);
    _subKeyPress = onKeyPress.listen(_onKeyPress.add);

    MDCTextfield.attachTo(targetRoot);
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
