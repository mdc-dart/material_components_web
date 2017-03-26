import 'package:angular2/angular2.dart';
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
/// ```
@Component(
    selector: 'mdc-fab',
    templateUrl: 'fab.html',
    directives: const [MdcRippleDirective])
class MdcFabComponent {
  @Input()
  bool mini = false, plain = false, ripple = true;
}
