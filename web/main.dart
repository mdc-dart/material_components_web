import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:material_components_web/material_components_web.dart';
import 'components/example_app/example_app.dart';

main() {
  bootstrap(ExampleAppComponent, [
    mdcProviders,
    COMMON_DIRECTIVES,
    ROUTER_PROVIDERS,
    provide(LocationStrategy, useClass: HashLocationStrategy),
  ]);
}
