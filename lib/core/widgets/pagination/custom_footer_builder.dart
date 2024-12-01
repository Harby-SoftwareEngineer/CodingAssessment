import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../src/main_index.dart';
import 'loading_widget.dart';


class CustomFooterBuilder extends StatelessWidget {
  const CustomFooterBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return CustomFooter(
      builder: (BuildContext context,LoadStatus? mode){
        print('mode $mode');
        Widget body ;
        if(mode == LoadStatus.noMore){
         // body =  Text(localization.no_more_data);
          body =  Text('');
        }
        else if(mode==LoadStatus.loading){
          body =  LoadingWidget();
        }
        else if(mode == LoadStatus.failed){
          body = Text(strings.load_failed_refresh_data);
        }
        else if(mode == LoadStatus.canLoading){
          body = Text(strings.load_more);
        }
        else if(mode == LoadStatus.idle){
          body = Text(strings.load_more);
        }
        else {
          body = Text('');
        }
        return Container(
          height: 55.0,
          alignment: Alignment.center,
          color: context.theme.scaffoldBackgroundColor,
          child: body,
        );
      },
    );
  }
}
