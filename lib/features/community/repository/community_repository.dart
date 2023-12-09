import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:reddit_clone/core/constants/firebase_constants.dart';
import 'package:reddit_clone/core/failure.dart';
import 'package:reddit_clone/core/providers/firebase_providers.dart';
import 'package:reddit_clone/core/type_def.dart';

import '../../../models/community_model.dart';

final communityRepositoryProvider = Provider((ref) {
  return CommunityRepository(firestore: ref.watch(fireStoreProvider));
});

class CommunityRepository {
  final FirebaseFirestore _firestore;

  CommunityRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  FutureVoid createCommunity(Community community) async {
    try {
      var communityDoc = await _communites.doc(community.name).get();
      if (communityDoc.exists) {
        throw 'Community with the same name already exists';
      }
      return right(
        _communites.doc(community.name).set(community.toMap()),
      );
    } on FirebaseException catch (e) {
      throw (e.message!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  CollectionReference get _communites =>
      _firestore.collection(FirebaseConstants.communitiesCollection);
}
