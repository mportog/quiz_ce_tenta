import 'package:flutter/material.dart';

class CustomBottomeSheet {
  Future<void> customBottomSheet(
      BuildContext context, String titlePage, dynamic content) {
    return showModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: false,
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0), topRight: Radius.circular(18))),
        builder: (BuildContext context) {
          return Container(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height, minHeight: 1),
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          SizedBox(width: 5),
                          Text(
                            titlePage,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Próximo',
                                style: TextStyle(color: Colors.blue),
                              ))
                        ]),
                    Container(
                        constraints: BoxConstraints(
                            minHeight: 1,
                            maxHeight: MediaQuery.of(context).size.height),
                        child: content),
                  ],
                ),
              ));
        });
  }
}
