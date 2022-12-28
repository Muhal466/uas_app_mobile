// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';

// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

class CupertinoPergeseran extends StatefulWidget {
  const CupertinoPergeseran({Key? key}) : super(key: key);

  @override
  State<CupertinoPergeseran> createState() => _CupertinoPergeseranState();
}

class _CupertinoPergeseranState extends State<CupertinoPergeseran>
    with RestorationMixin {
  final RestorableDouble _value = RestorableDouble(25.0);
  final RestorableDouble _discreteValue = RestorableDouble(20.0);

  @override
  String get restorationId => 'cupertino_slider_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_value, 'value');
    registerForRestoration(_discreteValue, 'discrete_value');
  }

  @override
  Widget build(BuildContext context) {
    // final localizations = GalleryLocalizations.of(context)!;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text('UAS'),
      ),
      child: DefaultTextStyle(
        style: CupertinoTheme.of(context).textTheme.textStyle,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoSlider(
                      value: _value.value,
                      min: 0.0,
                      max: 100.0,
                      onChanged: (value) {
                        setState(() {
                          _value.value = value;
                        });
                      },
                    ),
                  ),
                  MergeSemantics(
                    child: Text('ok'),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoSlider(
                      value: _discreteValue.value,
                      min: 0.0,
                      max: 100.0,
                      divisions: 5,
                      onChanged: (value) {
                        setState(() {
                          _discreteValue.value = value;
                        });
                      },
                    ),
                  ),
                  MergeSemantics(
                    child: Text('ini'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
