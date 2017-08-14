import 'package:angular/angular.dart';
import 'package:material_components_web/material_components_web.dart';

@Component(
    selector: 'icon-toggle-example',
    templateUrl: 'example_icon_toggle.html',
    styleUrls: const ['example_icon_toggle.css'],
    directives: const [mdcDirectives, COMMON_DIRECTIVES])
class IconToggleExampleComponent {
  bool favorited = false;
  String onIcon = 'favorite',
      offIcon = 'favorite_border',
      onLabel = 'Remove from Favorites',
      offLabel = 'Add to Favorites';

  String get favoritedStatus => favorited == true ? 'yes' : 'no';
}
