import 'package:angular/angular.dart';
import '../../mdc.dart' as mdc;

@Injectable()
class MdcAutoInitService {
  void autoInit() => mdc.autoInit();
}