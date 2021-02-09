import 'dart:convert';
import 'dart:js';
import 'package:bahasa_arab/package/flutter_animation_progress_bar.dart';
import 'package:bahasa_arab/package/slide_panel.dart';
import 'package:bahasa_arab/package/text_field.dart';
import 'package:bahasa_arab/viewModels/viewModels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:math';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;

import '../viewModels/viewModels.dart';

part 'bottomnavigation.dart';

part 'size_helpers.dart';

// Quiz
// part 'quiz/quiz.dart';
// Beginner
// part 'quiz/beginner/beginner.dart';
part 'quiz/beginner/beginner_quiz.dart';
part 'quiz/beginner/beginner_confirm.dart';
// Intermediate
// part 'quiz/intermediate/intermediate.dart';
part 'quiz/intermediate/intermediate_confirm.dart';
// part 'quiz/intermediate/q_brain.dart';
// Advance
part 'quiz/advance/advance_confirm.dart';
part 'quiz/advance/advance_session.dart';
// part 'quiz/advance/advance.dart';

// Learning
part 'learning/learning.dart';
part 'learning/mapel/list.dart';
part 'learning/mapel/materi.dart';
part 'learning/intermediate/inter_learn.dart';
part 'learning/advance/advance_learn.dart';

// Account
part 'account/user.dart';
part 'account/button/edit_account.dart';
part 'account/button/progres.dart';
part 'account/button/sertifikat.dart';
part 'form/login.dart';
part 'form/register.dart';
