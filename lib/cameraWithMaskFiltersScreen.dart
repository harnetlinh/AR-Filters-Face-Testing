import 'package:avatar_view/avatar_view.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/material.dart';
import 'dart:io' as Platform;

class CameraWithMaskFiltersScreen extends StatefulWidget {
  @override
  _CameraWithMaskFiltersScreenState createState() =>
      _CameraWithMaskFiltersScreenState();
}

class _CameraWithMaskFiltersScreenState
    extends State<CameraWithMaskFiltersScreen> {
  CameraDeepArController cameraDeepArController;
  String platformVersion = "Unknown";
  int currentPage = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffects = Effects.none;
  Filters currentFilters = Filters.none;
  Masks currentMark = Masks.none;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          //Deep AR Camera
          CameraDeepAr(
            onCameraReady: (isReady) {
              platformVersion = "Camera Status $isReady";
              print(platformVersion);
              setState(() {});
            },
            androidLicenceKey:
                "7f1c0c50cb2006cc71be40b65bedb728231d8bf316c341f553de4a3325bda91c0c336bc716f42db5",
            cameraDeepArCallback: (c) async {
              cameraDeepArController = c;
              setState(() {});
            },
          ),
          // Face Mask Filters - Image Buttons
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(8, (page) {
                        bool active = currentPage == page;

                        return Platform.Platform.isIOS
                            // ios app view
                            ? GestureDetector(
                                onTap: () {
                                  currentPage = page;
                                  cameraDeepArController.changeMask(page);
                                  setState(() {});
                                },
                                child: AvatarView(
                                  radius: active ? 65 : 30,
                                  borderColor: Colors.yellow,
                                  borderWidth: 2,
                                  isOnlyText: false,
                                  avatarType: AvatarType.CIRCLE,
                                  backgroundColor: Colors.red,
                                  imagePath:
                                      "assets/ios/${page.toString()}.jpg",
                                  placeHolder: Icon(
                                    Icons.person,
                                    size: 50,
                                  ),
                                  errorWidget: Container(
                                    child: Icon(
                                      Icons.error,
                                      size: 50,
                                    ),
                                  ),
                                ),
                              )
                            //android app view
                            : GestureDetector(
                                onTap: () {
                                  currentPage = page;
                                  cameraDeepArController.changeMask(page);
                                  setState(() {});
                                },
                                child: AvatarView(
                                  radius: active ? 65 : 30,
                                  borderColor: Colors.yellow,
                                  borderWidth: 2,
                                  isOnlyText: false,
                                  avatarType: AvatarType.CIRCLE,
                                  backgroundColor: Colors.red,
                                  imagePath:
                                      "assets/android/${page.toString()}.jpg",
                                  placeHolder: Icon(
                                    Icons.person,
                                    size: 50,
                                  ),
                                  errorWidget: Container(
                                    child: Icon(
                                      Icons.error,
                                      size: 50,
                                    ),
                                  ),
                                ),
                              );
                      }),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
