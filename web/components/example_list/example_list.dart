import 'package:angular/angular.dart';
import 'package:material_components_web/material_components_web.dart';

@Component(
    selector: 'list-example',
    templateUrl: 'example_list.html',
    directives: const [COMMON_DIRECTIVES, mdcDirectives])
class ListExampleComponent {
  bool avatar = false, bordered = false;
}
