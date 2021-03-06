part of '../tdapi.dart';

class OptimizeStorage extends TdFunction {
  int size;
  int ttl;
  int count;
  int immunityDelay;
  List<FileType> fileTypes;
  List<int> chatIds;
  List<int> excludeChatIds;
  bool returnDeletedFileStatistics;
  int chatLimit;
  dynamic extra;

  /// Optimizes storage usage, i.e. deletes some files and returns new storage usage statistics. Secret thumbnails can't be deleted. 
  /// [size] Limit on the total size of files after deletion. Pass -1 to use the default limit. 
  /// [ttl] Limit on the time that has passed since the last time a file was accessed (or creation time for some filesystems). Pass -1 to use the default limit. 
  /// [count] Limit on the total count of files after deletion. Pass -1 to use the default limit. 
  /// [immunityDelay] The amount of time after the creation of a file during which it can't be deleted, in seconds. Pass -1 to use the default value. 
  /// [fileTypes] If not empty, only files with the given type(s) are considered. By default, all types except thumbnails, profile photos, stickers and wallpapers are deleted. 
  /// [chatIds] If not empty, only files from the given chats are considered. Use 0 as chat identifier to delete files not belonging to any chat (e.g., profile photos). 
  /// [excludeChatIds] If not empty, files from the given chats are excluded. Use 0 as chat identifier to exclude all files not belonging to any chat (e.g., profile photos). 
  /// [returnDeletedFileStatistics] Pass true if deleted file statistics needs to be returned instead of the whole storage usage statistics. Affects only returned statistics. 
  /// [chatLimit] Same as in getStorageStatistics. Affects only returned statistics
  OptimizeStorage({this.size,
    this.ttl,
    this.count,
    this.immunityDelay,
    this.fileTypes,
    this.chatIds,
    this.excludeChatIds,
    this.returnDeletedFileStatistics,
    this.chatLimit});

  /// Parse from a json
  OptimizeStorage.fromJson(Map<String, dynamic> json) ;

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "size": this.size,
      "ttl": this.ttl,
      "count": this.count,
      "immunity_delay": this.immunityDelay,
      "file_types": this.fileTypes.map((i) => i.toJson()).toList(),
      "chat_ids": this.chatIds.map((i) => i).toList(),
      "exclude_chat_ids": this.excludeChatIds.map((i) => i).toList(),
      "return_deleted_file_statistics": this.returnDeletedFileStatistics,
      "chat_limit": this.chatLimit,
      "@extra": this.extra,
    };
  }

  static const CONSTRUCTOR = 'optimizeStorage';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}