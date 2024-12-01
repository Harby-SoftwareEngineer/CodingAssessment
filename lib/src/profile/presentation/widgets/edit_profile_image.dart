import 'dart:io';


import '../../../../core/utils/helper_methods.dart';
import '../../../../core/widgets/images/image_network.dart';
import '../../../main_index.dart';

class EditProfileImage extends BaseStatelessWidget {
  final String image;
  final Function(File) onSelectImage;

  EditProfileImage({super.key, required this.image, required this.onSelectImage});

  @override
  Widget build(BuildContext context) {
    StreamStateInitial<File?> _imageStream = StreamStateInitial();
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: context.secondaryContainer,
            shape: BoxShape.circle,
          ),
          child: StreamBuilder<File?>(
              stream: _imageStream.stream,
              builder: (context, snapshot) {
                return snapshot.data != null
                    ? Image.file(
                        snapshot.data!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      )
                    : ImageNetworkCircle(
                        image: image,
                        width: 100,
                        height: 100,
                      );
              }),
        ),
        PositionedDirectional(
          start: 30,
          bottom: 0,
          child: InkWell(
            onTap: () async {
              final file = await HelperMethods.getImagePicker();
              _imageStream.setData(File(file!.path));
              onSelectImage(File(file.path));
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: context.cardColor, width: 1.5,),
              ),
              child: AppIcon(
                icon: AppIcons.smartphone,
                padding: 5.paddingAll,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
