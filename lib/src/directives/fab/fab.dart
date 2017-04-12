import 'dart:html';
import 'package:angular2/angular2.dart';
import '../elevation/elevation.dart';
import '../ripple/ripple.dart';

/// The MDC FAB component is a spec-aligned button component adhering to the
/// [Material Design FAB requirements](https://material.google.com/components/buttons-floating-action-button.html).
///
/// # Example
///
/// ```html
/// <mdc-fab>
///   <mdc-icon icon="favorite"></mdc-icon>
/// </mdc-fab>
///
/// <mdc-fab [mini]="true">
///   <mdc-icon icon="favorite"></mdc-icon>
/// </mdc-fab>
///
/// <mdc-fab [plain]="true">
///   <mdc-icon icon="favorite"></mdc-icon>
/// </mdc-fab>
///
/// <mdc-fab [disabled]="true">
///   <mdc-icon icon="favorite"></mdc-icon>
/// </mdc-fab>
/// ```
@Component(
    selector: 'mdc-fab',
    templateUrl: 'fab.html',
    directives: const [MdcElevationDirective, MdcRippleDirective])
class MdcFabComponent {
  bool _disabled = false;

  @Input()
  int elevation = 0;

  @Input()
  bool mini = false, plain = false, ripple = true;

  @Output()
  final EventEmitter<Event> click = new EventEmitter<Event>();

  bool get disabled => _disabled == true;

  @Input()
  void set disabled(bool value) {
    _disabled = value == true;
  }

  @HostListener('click', const [r'$event'])
  void handleClick(Event e) {
    if (disabled) e.preventDefault();
    else click.add(e);
  }
}
