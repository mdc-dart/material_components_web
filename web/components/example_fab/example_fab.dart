import 'package:angular/angular.dart';
import 'package:material_components_web/material_components_web.dart';

@Component(
    selector: 'fab-example',
    templateUrl: 'example_fab.html',
    styleUrls: const ['example_fab.css'],
    directives: const [mdcDirectives])
class FabExampleComponent {
  String icon = 'favorite_border';
}
