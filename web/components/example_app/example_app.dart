import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:ngx_mdc/ngx_mdc.dart';
import '../example_fab/example_fab.dart';

@Component(
    selector: 'example-app',
    templateUrl: 'example_app.html',
    directives: const [MDC_DIRECTIVES, ROUTER_DIRECTIVES])
@RouteConfig(const [
  const Route(path: '/fab', name: 'Fab', component: FabExampleComponent)
])
class ExampleAppComponent {
  String title = 'Dart MDC Examples';
}
