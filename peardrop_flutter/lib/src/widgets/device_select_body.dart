import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:peardrop/src/home.dart';
import 'package:peardrop/src/utilities/nearby_device.dart';
import 'package:peardrop/src/widgets/sliding_panel.dart';
import 'package:peardrop/src/widgets/wave.dart';

typedef void DeviceSelectCallback(int index);
typedef void SetPanelCallback(bool panelOpen, PearPanel panel);
typedef void ResetCallBack();

class DeviceSelectBody extends StatelessWidget {
  DeviceSelectBody(
      {this.devices,
      this.fileShare,
      this.fileName,
      this.setPanel,
      this.deviceName,
      this.reset});

  final List<Device> devices;
  final DeviceSelectCallback fileShare;
  final ResetCallBack reset;
  final SetPanelCallback setPanel;
  final String deviceName, fileName;

  Widget build(BuildContext context) {
    double deviceSize = MediaQuery.of(context).size.width / 5;

    if (devices.length <= 0) {
      return Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Text(
            'Install PearDrop on nearby devices to send files',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      );
    } else {
      var deviceHeight = 25.0;
      var file = fileName;
      // topHeight = max((70 ~/ devices.length), 20).toDouble();
      if (Platform.isWindows || Platform.isMacOS) {
        deviceHeight = 2.5;
        final fileReg = RegExp(r'(.+)\\(.+)', multiLine: true);
        file = fileReg
            .allMatches(fileName)
            .map((m) => m.group(2))
            .toString()
            .replaceAll('(', '')
            .replaceAll(')', '');
      }
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff91c27d),
              Color(0xff559364),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(children: [
          SizedBox(
            height: deviceHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(7),
                  child: OutlineButton(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                    borderSide: BorderSide(color: Colors.white12),
                    color: Colors.white,
                    onPressed: () => reset(),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  )),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text('PearDrop',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: Colors.white)),
              ),
              Padding(
                padding: EdgeInsets.all(7),
                child: OutlineButton(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Icon(
                      Icons.info,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  borderSide: BorderSide(color: Colors.white12),
                  color: Colors.white,
                  // TODO: display TOS information when pressed
                  onPressed: () => {},
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                ),
              ),
            ],
          ),
          // TODO: design MultiChildRenderObjectWidget that can generate mutliple devices, fading them in and out as they appear nearby and displaying them in a random location within a set size
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(devices.length, (i) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
                      ),
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        devices[i].getName(),
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        setPanel(true, PearPanel.sharing);
                        fileShare(i);
                      },
                      elevation: 0.0,
                      fillColor: Color(0xff91c27d),
                      child: Icon(
                        devices[i].getIcon(),
                        size: 35.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
                  ],
                );
              }),
            ),
          ),
          // bottom widget displaying user device and file information
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    // Wave(),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CustomPaint(
                          size: Size(double.infinity, double.infinity),
                          painter: CircleWavePainter(0),
                          child: Container(
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150.0,
                      // margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4.0,
                            offset: const Offset(0.0, 4.0),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(deviceName,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 19,
                                  color: Colors.black)),
                          // TODO: display actual network name
                          Text('Connected to TP-Link',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.grey[600])),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[200],
                            ),
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.fromLTRB(15, 8, 15, 13),
                            child: Text(file,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xff559364),
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 85,
                height: 85,
                decoration:
                    ShapeDecoration(shape: CircleBorder(), color: Colors.white),
                child: DecoratedBox(
                  decoration: ShapeDecoration(
                    shape: CircleBorder(),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset('assets/images/icon.png').image,
                    ),
                  ),
                  // ),
                ),
              )
            ],
          ),
        ]),
      );
    }
  }
}
