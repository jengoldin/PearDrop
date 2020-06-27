import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

typedef void SetFileCallback(bool value, String name);

class FileSelect {
  String _path, _filePath = '', _extension;
  Map<String, String> _paths;
  bool _multiPick = false, _loadingPath = false;
  FileTypeCross _pickingType = FileTypeCross.any;
  TextEditingController _controller = new TextEditingController();

  // allows user to upload files
  void openFileExplorer(SetFileCallback setFile) async {
    _controller.addListener(() => _extension = _controller.text);
    String initialDirectory;
    final file = FilePickerCross(type: _pickingType, fileExtension: (_extension?.isNotEmpty ?? false)
        ? _extension?.replaceAll(' ', '')?.split(',').first
        : null);
    await file.pick();
    _path = file.path;
    _filePath = _path;
    // _filePath = _path != null
    //     ? _path.split('/').last
    //     : _paths != null ? _paths.keys.toString() : '...';
    if (_filePath != '' && _filePath != null && _filePath != '...') {
      setFile(true, _filePath);
    }
  }

  String nameFromPath(String filePath) {
    if (filePath == _path) {
      String fileName = _path != null
          ? _path.split('/').last
          : _paths != null ? _paths.keys.toString() : '...';
      if (Platform.isWindows || Platform.isMacOS) {
        final fileReg = RegExp(r'(.+)\\(.+)', multiLine: true);
        fileName = fileReg
            .allMatches(filePath)
            .map((m) => m.group(2))
            .toString()
            .replaceAll('(', '')
            .replaceAll(')', '');
        print('fileName: ' + fileName);
        return fileName;
      } else {
        return fileName;
      }
    } else {
      return filePath;
    }
  }

  Future<Uint8List> _readFileByte(String filePath) async {
    var myUri = Uri.parse(filePath);
    var temp = File.fromUri(myUri);

    Uint8List bytes;
    await temp.readAsBytes().then((value) {
      bytes = Uint8List.fromList(value);
      print('reading of bytes is completed');
    }).catchError((onError) {
      print('Exception Error while reading audio from path:' +
          onError.toString());
    });

    return bytes;
  }
}
