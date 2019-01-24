import 'package:angular_test/angular_test.dart';
import 'package:material_components_web/material_components_web.dart';
import 'package:test/test.dart';
import 'icon_test.template.dart' as ng;

main() {
  ng.initReflector();
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
