@Tags(const ['aot'])
@TestOn('browser')
import 'dart:html';

import 'package:angular_test/angular_test.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2_mdc/src/directives/icon/icon.dart';
import 'package:test/test.dart';

@AngularEntrypoint()
main() {
  tearDown(disposeAnyRunningTest);

  test('setting icon changes innerText', () async {
    var bed = new NgTestBed<MdcIconComponent>();
    var fixture = await bed.create();
    await fixture.update((c) => c.icon = 'menu');
    expect(fixture.text, 'menu');
  });

  test('setting iconSet changes class', () async {
    var bed = new NgTestBed<MdcIconComponent>();
    var fixture = await bed.create();
    await fixture.update((c) => c.iconSet = 'foo');
    expect(fixture.rootElement.classes.contains('foo'), isTrue);
    expect(fixture.rootElement.classes.contains('material-icons'), isFalse);
  });
}
