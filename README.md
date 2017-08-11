# material_components_web
[![Pub](https://img.shields.io/pub/v/material_components_web.svg)](https://pub.dartlang.org/packages/angular2_mdc)
[![build status](https://travis-ci.org/mdc-dart/material_components_web.svg)](https://travis-ci.org/mdc-dart/material_components_web)

Angular2Dart components for Google's [Material Design Components Library](https://github.com/material-components/material-components-web).

All components/services *will eventually be* unit-tested.

# Installation
In your `pubspec.yaml`:

```yaml
dependencies:
  material_components_web:
    git: https://github.com/mdc-dart/material_components_web.git
```

# Examples
To view the examples, run:

```bash
pub serve --web-compiler=dartdevc
```

And then visit `http://localhost:8080` in your browser.

If you are not using Dartium, then instead consider
pre-building the site:

```bash
pub build
```

Then, you can run a static server out of `build/web`.

# Testing
```bash
pub run angular_test --verbose
```

# Progress
Track progress
[here](https://github.com/mdc-dart/material_components_web/issues),
using the issue tracker.

PR's are always welcome!