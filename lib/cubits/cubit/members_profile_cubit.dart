import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'members_profile_state.dart';

class MembersProfileCubit extends Cubit<MembersProfileState> {
  MembersProfileCubit() : super(MembersProfileInitial());
}
