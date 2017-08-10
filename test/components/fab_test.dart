@Tags(const ['aot'])
@TestOn('browser')
// ignore: unused_import
import 'dart:html';

import 'package:angular_test/angular_test.dart';
import 'package:angular/angular.dart';
import 'package:material_components_web/material_components_web.dart';
import 'package:test/test.dart';

@AngularEntrypoint()
main() {
  tearDown(disposeAnyRunningTest);

  test('setting mini changes class', () async {
    var bed = new NgTestBed<MdcFabComponent>();
    var fixture = await bed.create();
    await fixture.update((c) => c.mini = true);
    expect(fixture.rootElement.classes.contains('mdc-fab--mini'), isTrue);
  });

  test('setting plain changes class', () async {
    var bed = new NgTestBed<MdcFabComponent>();
    var fixture = await bed.create();
    await fixture.update((c) => c.plain = true);
    expect(fixture.rootElement.classes.contains('mdc-fab--plain'), isTrue);
  });
}
