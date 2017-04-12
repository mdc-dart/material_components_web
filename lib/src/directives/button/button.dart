import 'dart:html';
import 'package:angular2/angular2.dart';
import '../elevation/elevation.dart';
import '../ripple/ripple.dart';

@Component(
    selector: 'mdc-button',
    templateUrl: 'button.html',
    directives: const [MdcElevationDirective, MdcRippleDirective])
class MdcButtonComponent {
  @Input()
  bool accent = false,
      compact = false,
      dense = false,
      disabled = false,
      primary = false,
      raised = false;

  @Input()
  int elevation = 0;

  @Input()
  String href;

  @Output()
  final EventEmitter<Event> click = new EventEmitter<Event>();

  @HostListener('click', const [r'$event'])
  void handleClick(Event e) {
    if (disabled == true) {
      e.preventDefault();
    } else
      click.add(e);
  }
}
