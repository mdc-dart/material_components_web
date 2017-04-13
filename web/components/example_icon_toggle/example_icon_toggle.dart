import 'package:angular2/angular2.dart';
import 'package:ngx_mdc/ngx_mdc.dart';

@Component(
    selector: 'icon-toggle-example',
    templateUrl: 'example_icon_toggle.html',
    styleUrls: const ['example_icon_toggle.css'],
    directives: const [MDC_DIRECTIVES])
class IconToggleExampleComponent {
  bool favorited = false;
  String onIcon = 'favorite',
      offIcon = 'favorite_border',
      onLabel = 'Remove from Favorites',
      offLabel = 'Add to Favorites';

  String get favoritedStatus => favorited == true ? 'yes' : 'no';
}
