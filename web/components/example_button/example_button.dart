import 'package:angular2/angular2.dart';
import 'package:ngx_mdc/ngx_mdc.dart';

@Component(
    selector: 'button-example',
    templateUrl: 'example_button.html',
    styleUrls: const ['example_button.css'],
    directives: const [MDC_DIRECTIVES])
class ButtonExampleComponent {
  String link = 'https://dartlang.org';
}
