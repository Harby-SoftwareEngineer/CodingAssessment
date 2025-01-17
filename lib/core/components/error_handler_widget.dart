
import '../widgets/container/background_container.dart';
import '../widgets/texts/black_texts.dart';
import '../widgets/texts/white_texts.dart';
import '/src/main_index.dart';
// ignore: must_be_immutable
class ErrorPlaceHolderWidget extends StatelessWidget {


  final String? error;
  final String? title;
  final Function()? onClickReload;
  final dynamic exception;
  final Color? color;
  final bool showImage ;
  final double? height;
   ErrorPlaceHolderWidget({Key? key,
     this.error,
    this.exception,
     this.title ,
    this.onClickReload,
     this.showImage = true,
    this.color,
    this.height,
     this.placeHolderImage
  }) : super(key: key);
  Widget ? placeHolderImage ;
   String ?  message ;



  @override
  Widget build(BuildContext context) {

    message  = context.handleApiErrorMessage( exception: exception);
    return BackgroundContainer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              placeHolderImage!=null && showImage?
              Container(
                color: color ?? Colors.white,
                margin: const EdgeInsets.only(bottom: 12),
                child: placeHolderImage,
              ):Container(),
              title!=null ? BlackMediumText(label: title!,):Container(),

              WhiteRegularText(
                label: message.toString().trim(),
                textAlign: TextAlign.center,
              ),
              10.ph,
              PrimaryButton(
                onPressed: onClickReload,
                title: context.strings.reload,
              )
            ],
          ),
        ),
    );
  }
}
