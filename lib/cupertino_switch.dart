// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pergeseran.dart';

// import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

class CupertinoSwitchDemo extends StatefulWidget {
  const CupertinoSwitchDemo({Key? key}) : super(key: key);

  @override
  State<CupertinoSwitchDemo> createState() => _CupertinoSwitchDemoState();
}

class _CupertinoSwitchDemoState extends State<CupertinoSwitchDemo>
    with RestorationMixin {
  final RestorableBool _switchValue = RestorableBool(false);

  @override
  String get restorationId => 'cupertino_switch_demo';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_switchValue, 'switch_value');
  }

  @override
  Widget build(BuildContext context) {
    // final localizations = GalleryLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ujian akhir semester'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_circle_right_sharp),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CupertinoPergeseran()));
            },
          ),
        ],
      ),
      body: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
          middle: Text('muhammad arief alfaisa'),
        ),
        child: Center(
          child: Semantics(
            container: true,
            child: CupertinoSwitch(
              value: _switchValue.value,
              onChanged: (value) {
                setState(() {
                  _switchValue.value = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
