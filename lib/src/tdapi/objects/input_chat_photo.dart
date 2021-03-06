part of '../tdapi.dart';

class InputChatPhoto extends TdObject {
  

  /// Describes a photo to be set as a user profile or chat photo
  InputChatPhoto();

  /// a InputChatPhoto return type can be :
  /// * InputChatPhotoPrevious
  /// * InputChatPhotoStatic
  /// * InputChatPhotoAnimation
  factory InputChatPhoto.fromJson(Map<String, dynamic> json)  {
    switch(json["@type"]) {
      case InputChatPhotoPrevious.CONSTRUCTOR:
        return InputChatPhotoPrevious.fromJson(json);
      case InputChatPhotoStatic.CONSTRUCTOR:
        return InputChatPhotoStatic.fromJson(json);
      case InputChatPhotoAnimation.CONSTRUCTOR:
        return InputChatPhotoAnimation.fromJson(json);
      default:
        return null;
    }
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      
    };
  }

  static const CONSTRUCTOR = 'inputChatPhoto';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputChatPhotoPrevious extends InputChatPhoto {
  String chatPhotoId;

  /// A previously used profile photo of the current user. 
  /// [chatPhotoId] Identifier of the profile photo to reuse
  InputChatPhotoPrevious({this.chatPhotoId});

  /// Parse from a json
  InputChatPhotoPrevious.fromJson(Map<String, dynamic> json)  {
    this.chatPhotoId = json['chat_photo_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "chat_photo_id": this.chatPhotoId,
    };
  }

  static const CONSTRUCTOR = 'inputChatPhotoPrevious';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputChatPhotoStatic extends InputChatPhoto {
  InputFile photo;

  /// A static photo in JPEG format. 
  /// [photo] Photo to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
  InputChatPhotoStatic({this.photo});

  /// Parse from a json
  InputChatPhotoStatic.fromJson(Map<String, dynamic> json)  {
    this.photo = InputFile.fromJson(json['photo'] ?? <String, dynamic>{});
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "photo": this.photo == null ? null : this.photo.toJson(),
    };
  }

  static const CONSTRUCTOR = 'inputChatPhotoStatic';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}

class InputChatPhotoAnimation extends InputChatPhoto {
  InputFile animation;
  double mainFrameTimestamp;

  /// An animation in MPEG4 format; must be square, shorter than 10 seconds, have width between 160 and 800 and be at most 2MB in size. 
  /// [animation] Animation to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed. 
  /// [mainFrameTimestamp] Timestamp of the frame, which will be used as static chat photo
  InputChatPhotoAnimation({this.animation,
    this.mainFrameTimestamp});

  /// Parse from a json
  InputChatPhotoAnimation.fromJson(Map<String, dynamic> json)  {
    this.animation = InputFile.fromJson(json['animation'] ?? <String, dynamic>{});
    this.mainFrameTimestamp = json['main_frame_timestamp'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "animation": this.animation == null ? null : this.animation.toJson(),
      "main_frame_timestamp": this.mainFrameTimestamp,
    };
  }

  static const CONSTRUCTOR = 'inputChatPhotoAnimation';
  
  @override
  String getConstructor() => CONSTRUCTOR;
}