import 'package:blogger/core/error/failures.dart';
import 'package:blogger/core/network/connection_checker.dart';
import 'package:blogger/core/params/empty_params.dart';
import 'package:blogger/core/params/user_login_params.dart';
import 'package:blogger/core/params/user_sign_up_params.dart';
import 'package:blogger/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blogger/features/auth/data/models/user_models.dart';
import 'package:blogger/features/auth/data/repositories/auth_repository_implementation.dart';
import 'package:blogger/features/auth/domain/repository/auth_repository.dart';
import 'package:blogger/features/auth/domain/usecases/current_user.dart';
import 'package:blogger/features/auth/domain/usecases/user_login.dart';
import 'package:blogger/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part '../../features/auth/presentation/provider/auth_provider.dart';
