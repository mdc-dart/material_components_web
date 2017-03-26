import 'package:angular2/platform/browser.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:ngx_mdc/ngx_mdc.dart';
import 'components/example_app/example_app.dart';

main() => bootstrap(ExampleAppComponent, [
      FORM_DIRECTIVES,
      MDC_DIRECTIVES,
      MDC_PROVIDERS,
      ROUTER_PROVIDERS,
      provide(LocationStrategy, useClass: HashLocationStrategy)
    ]);
