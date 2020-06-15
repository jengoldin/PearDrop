import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:peardrop/src/widgets/progress_indicator.dart';

class SlidingPanelSend extends StatelessWidget {
  SlidingPanelSend(
      {this.nameOfRecipient,
      this.iconOfRecipient,
      this.sc,
      this.fileName,
      this.cancel});

  final String nameOfRecipient, fileName;
  final ScrollController sc;
  final IconData iconOfRecipient;
  final CloseButton cancel;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [cancel],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Sharing to " + nameOfRecipient,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Open Sans',
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(0, 21, 0, 21),
                        color: Colors.grey[50],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: Icon(
                                Icons.description,
                                size: 30,
                              ),
                            ),
                            Center(
                              child: Text(fileName,
                                  style: TextStyle(
                                      fontFamily: 'Open Sans', fontSize: 15)),
                            ),
                          ],
                        ),
                      ),
                    ]),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(0, 16, 0, 2),
                  child: PercentageProgressIndicator(
                      centerIcon: Icons.file_upload),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(18, 10, 3, 0),
                        child: Icon(
                          // Icons.device_unknown,
                          Icons.devices,
                          size: 30,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                          child: Text(
                              'Make sure both devices are unlocked, within a reasonable distance, and have Bluetooth and WiFi enabled',
                              style: TextStyle(
                                  fontFamily: 'Open Sans', fontSize: 15)),
                        ),
                      )
                    ],
                  ),
                ),
                // Row()
              ],
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ));
  }
}
