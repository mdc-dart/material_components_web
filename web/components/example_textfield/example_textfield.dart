import 'package:angular/angular.dart';
import 'package:material_components_web/material_components_web.dart';

@Component(
  selector: 'textfield-example',
  templateUrl: 'example_textfield.html',
  directives: const [
    mdcDirectives,
    COMMON_DIRECTIVES,
  ],
)
class TextfieldExampleComponent {
  String buttonText = 'Button Text', hintText = 'Enter Button Text';
}
