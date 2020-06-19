import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:peardrop/src/utilities/nearby_device.dart';
import 'package:peardrop/src/widgets/linear_progress_indicator.dart';

class SlidingPanelSend extends StatelessWidget {
  SlidingPanelSend({this.peerDevice, this.sc, this.fileName, this.cancel});

  final String fileName;
  final Device peerDevice;
  final ScrollController sc;
  final CloseButton cancel;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [cancel],
            // ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sharing to " + peerDevice.getName(),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
                        color: Colors.grey[50],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: Icon(
                                Icons.description,
                                size: 20,
                              ),
                            ),
                            Center(
                              child: Text(fileName,
                                  style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: LinearPercentageProgressIndicator(),
                      )
                    ]),
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   padding: EdgeInsets.fromLTRB(0, 16, 0, 2),
                //   child: PercentageProgressIndicator(
                //       centerIcon: peerDevice.getIcon()),
                // ),

                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   padding: EdgeInsets.fromLTRB(0, 10, 0, 2),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.fromLTRB(18, 10, 3, 0),
                //         child: Icon(
                //           // Icons.device_unknown,
                //           Icons.devices,
                //           size: 30,
                //         ),
                //       ),
                //       Expanded(
                //         child: Padding(
                //           padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                //           child: Text(
                //               'Make sure both devices are unlocked, within a reasonable distance, and have Bluetooth and WiFi enabled',
                //               style: TextStyle(fontSize: 15)),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                // Row()
              ],
            ),
          ],
        ));

    // return Container(
    //     decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.all(Radius.circular(24.0)),
    //         boxShadow: [
    //           BoxShadow(
    //             blurRadius: 20.0,
    //             color: Colors.grey[350],
    //           ),
    //         ]),
    //     margin: const EdgeInsets.all(24.0),
    //     child: Center(
    //       child: ListView(
    //         controller: sc,
    //         children: <Widget>[
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: [cancel],
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               Text(
    //                 "Sharing to " + peerDevice.getName(),
    //                 style: TextStyle(
    //                   fontWeight: FontWeight.normal,
    //                   fontSize: 20.0,
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 15.0,
    //           ),
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: <Widget>[
    //               Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: <Widget>[
    //                     Container(
    //                       width: MediaQuery.of(context).size.width,
    //                       padding: EdgeInsets.fromLTRB(0, 21, 0, 21),
    //                       color: Colors.grey[50],
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           Padding(
    //                             padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
    //                             child: Icon(
    //                               Icons.description,
    //                               size: 30,
    //                             ),
    //                           ),
    //                           Center(
    //                             child: Text(fileName,
    //                                 style: TextStyle(fontSize: 15)),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ]),
    //               Container(
    //                 width: MediaQuery.of(context).size.width,
    //                 padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
    //                 child: PercentageProgressIndicator(
    //                     centerIcon: peerDevice.getIcon()),
    //               ),
    //               Container(
    //                 width: MediaQuery.of(context).size.width,
    //                 padding: EdgeInsets.fromLTRB(0, 10, 0, 2),
    //                 color: Colors.grey[50],
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Padding(
    //                       padding: EdgeInsets.fromLTRB(18, 10, 3, 0),
    //                       child: Icon(
    //                         // Icons.device_unknown,
    //                         Icons.devices,
    //                         size: 30,
    //                       ),
    //                     ),
    //                     Expanded(
    //                       child: Padding(
    //                         padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
    //                         child: Text(
    //                             'Make sure both devices are unlocked, within a reasonable distance, and have Bluetooth and WiFi enabled',
    //                             style: TextStyle(fontSize: 15)),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 15.0,
    //               ),
    //             ],
    //           ),
    //           Container(
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.only(
    //                   bottomLeft: Radius.circular(24.0),
    //                   bottomRight: Radius.circular(24.0)),
    //             ),
    //             width: MediaQuery.of(context).size.width,
    //             padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
    //             child: Center(
    //               child: Text('Your device is visible as cubic-opulent',
    //                   style: TextStyle(fontSize: 15)),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ));
  }
}
