import 'package:angular/angular.dart';
import 'package:material_components_web/material_components_web.dart';

@Component(
    selector: 'button-example',
    templateUrl: 'example_button.html',
    styleUrls: const ['example_button.css'],
    directives: const [mdcDirectives])
class ButtonExampleComponent {
  String link = 'https://dartlang.org';
}
