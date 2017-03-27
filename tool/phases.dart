import 'package:build_runner/build_runner.dart';
import 'package:sass_builder/sass_builder.dart';

final PhaseGroup PHASES = new PhaseGroup.singleAction(
    new SassBuilder(), new InputSet('ngx_mdc', ['**/*.scss', '**/*.sass']));
