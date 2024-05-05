// Pages

export 'data/datasource/remote_datasource.dart';

// Widgets

export 'presentaion/widgets/segment_item.dart';
export 'presentaion/dialogs/add_segment_dialog.dart';
export 'presentaion/dialogs/add_users_dialog.dart';
export 'presentaion/dialogs/update_segment_dialog.dart';
export 'presentaion/dialogs/users_segments_dialog.dart';

// repo

export 'domain/repositories/repository.dart';
export 'data/repositories/repository_impl.dart';

// Use cases

export 'domain/use_cases/add_segment.dart';
export 'domain/use_cases/update_segment.dart';
export 'domain/use_cases/add_segment_users.dart';
export 'domain/use_cases/get_segment.dart';
export 'domain/use_cases/get_users_segment.dart';

// Models

export 'data/models/segments_response_model.dart';
export 'data/models/users_response_model.dart';

// Entities
export 'domain/entities/segment_request.dart';
export 'domain/entities/segment_user_request.dart';
export 'domain/entities/segments_response.dart';
export 'domain/entities/user_response.dart';

// Blocs
export 'presentaion/blocs/home_bloc/home_cubit.dart';
