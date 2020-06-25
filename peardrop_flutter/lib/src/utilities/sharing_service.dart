import 'dart:io';

import 'package:file_chooser/file_chooser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

typedef void SetFileCallback(bool value, String name);

class SharingService {
  String _path, _fileName = '', _extension;
  Map<String, String> _paths;
  bool _multiPick = false, _loadingPath = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = new TextEditingController();
  int peerIndex = 0;

  // handleFileSend(fileName, filePath, mime, ip) {}

  void handleFileSelect(SetFileCallback setFile) {
    openFileExplorer(setFile);
  }

  // handles what happens after file is selected and device chosen
  void handleFileShare(int index) {
    peerIndex = index;
    // pc.open();
  }

  // handles what happens after file is accepted
  void handleFileReceive() {
    // setState(() {
    //   pearPanel = PearPanel.receiving;
    // });
  }

  // cancels file sharing
  void cancelShare() {
    // _pc.close();
  }

  // allows user to upload files
  void openFileExplorer(SetFileCallback setFile) async {
    _controller.addListener(() => _extension = _controller.text);
    String initialDirectory;
    if (Platform.isMacOS || Platform.isWindows) {
      initialDirectory = (await getApplicationDocumentsDirectory()).path;
      final result = await showOpenPanel(
          allowsMultipleSelection: true, initialDirectory: initialDirectory);
      _path = '${result.paths.join('\n')}';
    } else if (Platform.isIOS || Platform.isAndroid) {
      _loadingPath = true;
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType,
              allowedExtensions: (_extension?.isNotEmpty ?? false)
                  ? _extension?.replaceAll(' ', '')?.split(',')
                  : null);
        } else {
          _paths = null;
          _path = await FilePicker.getFilePath(
              type: _pickingType,
              allowedExtensions: (_extension?.isNotEmpty ?? false)
                  ? _extension?.replaceAll(' ', '')?.split(',')
                  : null);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
    }

    _loadingPath = false;
    _fileName = _path != null
        ? _path.split('/').last
        : _paths != null ? _paths.keys.toString() : '...';
    if (_fileName != '' && _fileName != null && _fileName != '...') {
      setFile(true, _fileName);
    }
  }
}
