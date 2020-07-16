// Copyright 2020 Kenton Hamaluik
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timecop/blocs/timers/bloc.dart';
import 'package:timecop/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:timecop/screens/dashboard/components/StartTimerSpeedDial.dart';
import 'package:timecop/screens/dashboard/components/TimerTypeDial.dart';

class StartTimerButton extends StatefulWidget {
  StartTimerButton({Key key}) : super(key: key);

  @override
  _StartTimerButtonState createState() => _StartTimerButtonState();
}

class _StartTimerButtonState extends State<StartTimerButton> {
  @override
  Widget build(BuildContext context) {
    final DashboardBloc bloc = BlocProvider.of<DashboardBloc>(context);
    assert(bloc != null);

    return BlocBuilder<TimersBloc, TimersState>(
        builder: (BuildContext context, TimersState timersState) {
      if (timersState.timers.where((t) => t.endTime == null).isEmpty) {
        return TimerTypeDial();
      } else {
        return StartTimerSpeedDial();
      }
    });
  }
}
