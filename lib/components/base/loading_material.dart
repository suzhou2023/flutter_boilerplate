import 'package:flutter/material.dart';

class LoadingMaterial extends StatelessWidget {
  const LoadingMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black12,
      child: Center(
        child: Card(
          elevation: 10,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(45, 40, 45, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                SizedBox(
                  width: 68,
                  height: 68,
                  child: CircularProgressIndicator(strokeWidth: 6),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text('Pemuatan ...'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
