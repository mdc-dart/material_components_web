import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:material_components_web/material_components_web.dart';
import 'components/example_app/example_app.template.dart' as ng;
import 'main.template.dart' as self;

@GenerateInjector([
  mdcProviders,
  coreDirectives,
  routerProvidersHash,
])
final InjectorFactory rootInjector = self.rootInjector$Injector;

main() {
  // ignore: argument_type_not_assignable
  runApp(ng.ExampleAppComponentNgFactory, createInjector: rootInjector);
}
