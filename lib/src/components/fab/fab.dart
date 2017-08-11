import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
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
class MdcFabComponent implements OnDestroy {
  bool _disabled = false;

  final StreamController<Event> _click = new StreamController<Event>();

  @Input()
  int elevation = 2;

  @Input()
  bool mini = false, plain = false, ripple = true;

  @Output()
  Stream<Event> get click => _click.stream;

  bool get disabled => _disabled == true;

  @Input()
  void set disabled(bool value) {
    _disabled = value == true;
  }

  @override
  ngOnDestroy() {
    _click.close();
  }

  @HostListener('click', const [r'$event'])
  void handleClick(Event e) {
    if (disabled)
      e.preventDefault();
    else
      _click.add(e);
  }
}
