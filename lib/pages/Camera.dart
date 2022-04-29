import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:diploma/model/Photo.dart';
import 'package:diploma/pages/finish_add.dart';
import 'package:diploma/services/remote_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

class Camera extends StatefulWidget {
  Camera({Key? key}) : super(key: key);



  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  PickedFile? _imageFile;
  dynamic _pickImageError;
  bool isVideo = false;
  VideoPlayerController? _controller;
  VideoPlayerController? _toBeDisposed;
  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  late Photo photo;

  Future<void> _playVideo(PickedFile? file) async {
    if (file != null && mounted) {
      await _disposeVideoController();
      late VideoPlayerController controller;
      if (kIsWeb) {
        controller = VideoPlayerController.network(file.path);
      } else {
        controller = VideoPlayerController.file(File(file.path));
      }
      _controller = controller;
      final double volume = kIsWeb ? 0.0 : 1.0;
      await controller.setVolume(volume);
      await controller.initialize();
      await controller.setLooping(true);
      await controller.play();
      setState(() {});
    }
  }

  void _onImageButtonPressed(ImageSource source,
      {BuildContext? context}) async {
    if (_controller != null) {
      await _controller!.setVolume(0.0);
    }
    if (isVideo) {
      final PickedFile? file = await _picker.getVideo(
          source: source, maxDuration: const Duration(seconds: 10));
      await _playVideo(file);
    } else {
      await _displayPickImageDialog(context!,
              (double? maxWidth, double? maxHeight, int? quality) async {
            try {
              final pickedFile = await _picker.getImage(
                source: source,
                maxWidth: maxWidth,
                maxHeight: maxHeight,
                imageQuality: quality,
              );
              setState(() {
                _imageFile = pickedFile;
              });
            } catch (e) {
              setState(() {
                _pickImageError = e;
              });
            }
          });
    }
  }

  @override
  void deactivate() {
    if (_controller != null) {
      _controller!.setVolume(0.0);
      _controller!.pause();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _disposeVideoController();
    maxWidthController.dispose();
    maxHeightController.dispose();
    qualityController.dispose();
    super.dispose();
  }

  Future<void> _disposeVideoController() async {
    if (_toBeDisposed != null) {
      await _toBeDisposed!.dispose();
    }
    _toBeDisposed = _controller;
    _controller = null;
  }

  Widget _previewVideo() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_controller == null) {
      return const Text(
        'Вы не выбрали видео',
        textAlign: TextAlign.center,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AspectRatioVideo(_controller),
    );
  }

  Widget _previewImage() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFile != null) {
      if (kIsWeb) {
        return Image.network(_imageFile!.path);
      } else {
        return Semantics(
            child: Image.file(File(_imageFile!.path)),
            label: 'image_picker_example_picked_image');
      }
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'Вы не выбрали фотографию',
        textAlign: TextAlign.center,
      );
    }
  }

  Future<void> retrieveLostData() async {
    final LostData response = await _picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      if (response.type == RetrieveType.video) {
        isVideo = true;
        await _playVideo(response.file);
      } else {
        isVideo = false;
        setState(() {
          _imageFile = response.file;
        });
      }
    } else {
      _retrieveDataError = response.exception!.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавление фотографии'),
      ),
      body: Center(
        child: !kIsWeb && defaultTargetPlatform == TargetPlatform.android
            ? FutureBuilder<void>(
          future: retrieveLostData(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Text(
                  'Вы не выбрали фотографию',
                  textAlign: TextAlign.center,
                );
              case ConnectionState.done:
                return isVideo ? _previewVideo() : _previewImage();
              default:
                if (snapshot.hasError) {
                  return Text(
                    'Pick image/video error: ${snapshot.error}}',
                    textAlign: TextAlign.center,
                  );
                } else {
                  return const Text(
                    'Вы не выбрали фотографию',
                    textAlign: TextAlign.center,
                  );
                }
            }
          },
        )
            : (isVideo ? _previewVideo() : _previewImage()),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Semantics(
            child: FloatingActionButton(
              onPressed: () async {
                log(File(_imageFile!.path).toString(), name: 'путь картинки');
                String urlimage = await RemoteService().sendPhoto(File(_imageFile!.path));
                final prefs = await SharedPreferences.getInstance();
                int? id =  prefs.getInt('nowidadv');
                log(id.toString(), name: 'проверка id объявления');
                log(urlimage, name: 'проверка ссылки');
                RemoteService().createImage(id!, urlimage);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FinishAdd()),
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Semantics(
              label: 'image_picker_example_from_gallery',
              child: FloatingActionButton(
                onPressed: () {
                  isVideo = false;
                  _onImageButtonPressed(ImageSource.gallery, context: context);
                },
                heroTag: 'image0',
                tooltip: 'Pick Image from gallery',
                child: const Icon(Icons.photo_library),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FloatingActionButton(
              onPressed: () {
                isVideo = false;
                _onImageButtonPressed(ImageSource.camera, context: context);
              },
              heroTag: 'image1',
              tooltip: 'Take a Photo',
              child: const Icon(Icons.camera_alt),
            ),
          ),
        ],
      ),
    );
  }

  Text? _getRetrieveErrorWidget() {
    if (_retrieveDataError != null) {
      final Text result = Text(_retrieveDataError!);
      _retrieveDataError = null;
      return result;
    }
    return null;
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Добавить параметры фотографии'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: maxWidthController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                  InputDecoration(hintText: "Максимальная длина"),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                  InputDecoration(hintText: "Максимальная высота"),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration:
                  InputDecoration(hintText: "Выберете качество"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 20),
                  child: Text(
                      'Все параметры не обязательны', style: TextStyle(color: Color(0xff246E46)),
                  ),
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Отмена'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('Выбрать'),
                  onPressed: () {
                    double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }
}

typedef void OnPickImageCallback(
    double? maxWidth, double? maxHeight, int? quality);

class AspectRatioVideo extends StatefulWidget {
  AspectRatioVideo(this.controller);

  final VideoPlayerController? controller;

  @override
  AspectRatioVideoState createState() => AspectRatioVideoState();
}

class AspectRatioVideoState extends State<AspectRatioVideo> {
  VideoPlayerController? get controller => widget.controller;
  bool initialized = false;

  void _onVideoControllerUpdate() {
    if (!mounted) {
      return;
    }
    if (initialized != controller!.value.isInitialized) {
      initialized = controller!.value.isInitialized;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    controller!.addListener(_onVideoControllerUpdate);
  }

  @override
  void dispose() {
    controller!.removeListener(_onVideoControllerUpdate);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (initialized) {
      return Center(
        child: AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
      );
    } else {
      return Container();
    }
  }
}