part of '../tdapi.dart';

class GetSuitableDiscussionChats extends TdFunction {
  dynamic extra;

  /// Returns a list of basic group and supergroup chats, which can be used as a discussion group for a channel. Basic group chats need to be first upgraded to supergroups before they can be set as a discussion group
  GetSuitableDiscussionChats();

  /// Parse from a json
  GetSuitableDiscussionChats.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "@extra": this.extra,
    };
  }

  static const CONSTRUCTOR = 'getSuitableDiscussionChats';
}