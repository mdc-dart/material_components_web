// ignore_for_file: uri_has_not_been_generated, undefined_identifier, argument_type_not_assignable
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:material_components_web/material_components_web.dart';
import '../example_button/example_button.template.dart';
import '../example_dialog/example_dialog.template.dart';
import '../example_fab/example_fab.template.dart';
import '../example_icon_toggle/example_icon_toggle.template.dart';
import '../example_list/example_list.template.dart';
import '../example_textfield/example_textfield.template.dart';

@Component(
    selector: 'example-app',
    templateUrl: 'example_app.html',
    directives: [mdcDirectives, routerDirectives])
class ExampleAppComponent implements OnInit {
  final MdcAutoInitService _autoInitService;

  var routes = [
    RouteDefinition(
      path: '/button',
      component: ButtonExampleComponentNgFactory,
    ),
    RouteDefinition(
      path: '/dialog',
      component: DialogExampleComponentNgFactory,
    ),
    RouteDefinition(
      path: '/fab',
      component: FabExampleComponentNgFactory,
    ),
    RouteDefinition(
      path: '/icon-toggle',
      component: IconToggleExampleComponentNgFactory,
    ),
    RouteDefinition(
      path: '/list',
      component: ListExampleComponentNgFactory,
    ),
    RouteDefinition(
      path: '/textfield',
      component: TextfieldExampleComponentNgFactory,
    ),
  ];

  String title = 'Material Design Components';

  ExampleAppComponent(this._autoInitService);

  @ViewChild('drawer')
  MdcDrawerComponent drawer;

  @override
  ngOnInit() {
    _autoInitService.autoInit();
  }
}
