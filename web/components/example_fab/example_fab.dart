import 'package:angular2/angular2.dart';
import 'package:ngx_mdc/ngx_mdc.dart';

@Component(
    selector: 'fab-example',
    templateUrl: 'example_fab.html',
    styleUrls: const ['example_fab.css'],
    directives: const [MDC_DIRECTIVES])
class FabExampleComponent {
  String icon = 'add';
  bool mini, plain, bottom_right = true;
}
