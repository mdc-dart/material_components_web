import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import '../elevation/elevation.dart';
import '../ripple/ripple.dart';

@Component(
    selector: 'mdc-button',
    templateUrl: 'button.html',
    directives: const [
      COMMON_DIRECTIVES,
      MdcElevationDirective,
      MdcRippleDirective
    ],
styles: const [
  '''
  .mdc-button.flex {
    display: flex;
    align-items: center;
  }

  .mdc-button.flex /deep/ * {
    display: flex;
  }
  '''
])
class MdcButtonComponent implements OnDestroy {
  final StreamController<Event> _click = new StreamController<Event>();

  @Input()
  bool accent = false,
      compact = false,
      dense = false,
      disabled = false,
      primary = false,
      raised = false;

  @Input()
  int elevation = 0;

  /// Apply flexbox styling to this component.
  @Input()
  bool flex = false;

  @Input()
  String href;

  @Output()
  Stream<Event> get click => _click.stream;

  @override
  ngOnDestroy() {
    _click.close();
  }

  @HostListener('click', const [r'$event'])
  void handleClick(Event e) {
    if (disabled == true) {
      e.preventDefault();
    } else
      _click.add(e);
  }
}
