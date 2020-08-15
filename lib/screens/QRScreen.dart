import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  String qrText ;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');


    void _launchURL(String url) async {
      if (await canLaunch(url)) {
      await launch(url,
          forceWebView: true, enableJavaScript: true); //forceWebView
    } else {
        throw 'Could not launch $url';
      }
    }


  @override
  void initState() {
      //_launchURL("qrText");
    print(qrText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child:Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                    image: DecorationImage(
                        image: AssetImage('images/gradient.png'),
                        fit: BoxFit.cover
                    )
                ),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.arrow_back_ios),
                        iconSize: 30.0,
                        color: Colors.white,
                      ),
                    ),

                    Text('Add New Shop',style: TextStyle(fontSize: 35.0,color: Colors.white),),

                  ],
                ),
              )
            ),
            Expanded(
              flex: 4,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Color(0xffff9100),
                  borderRadius: 10,
                  borderLength: 30,
                  borderWidth: 10,
                  cutOutSize: 300,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
        _launchURL(qrText);
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}