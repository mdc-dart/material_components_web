import 'package:angular2/angular2.dart';
import '../mdc.dart' as mdc;

@Injectable()
class MdcAutoInitService {
  MdcAutoInitService() {
    mdc.autoInit();
  }
}