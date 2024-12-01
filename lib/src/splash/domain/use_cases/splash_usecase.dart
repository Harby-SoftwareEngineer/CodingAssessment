import 'package:injectable/injectable.dart';

import '../entities/splash.dart';
import '../repositories/base_splash_repo.dart';


@Injectable()
class SplashUseCase {
  final BaseSplashRepo repository ;
  SplashUseCase(this.repository);

  Future<List<Splash>> fetchSplashData() async {
    //return await repository.fetchSplashData();
    return [
      Splash(
        id: 1,
       image: 'https://w7.pngwing.com/pngs/117/868/png-transparent-water-splash-water-drops-water-droplet-blue-drop-color.png',
        description: "Splash Title Splash Title Splash Title Splash  Splash Title",
      ),
      Splash(
        id: 1,
        image: 'https://w7.pngwing.com/pngs/117/868/png-transparent-water-splash-water-drops-water-droplet-blue-drop-color.png',
        description: "Splash Title Splash Title Splash Title Splash  Splash Title",
      ),
      Splash(
        id: 1,
        image: 'https://w7.pngwing.com/pngs/117/868/png-transparent-water-splash-water-drops-water-droplet-blue-drop-color.png',
        description: "Splash Title Splash Title Splash Title Splash  Splash Title",
      ),
    ];
  }
}