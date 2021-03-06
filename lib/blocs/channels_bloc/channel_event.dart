import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:twake/blocs/notification_bloc/notification_bloc.dart';

abstract class ChannelsEvent extends Equatable {
  const ChannelsEvent();
}

class ReloadChannels extends ChannelsEvent {
  final String workspaceId;
  // parent company id for directs
  final String companyId;
  final bool forceFromApi;
  const ReloadChannels({
    this.workspaceId,
    this.companyId,
    this.forceFromApi: false,
  });
  @override
  List<Object> get props => [];
}

class ClearChannels extends ChannelsEvent {
  const ClearChannels();
  @override
  List<Object> get props => [];
}

class UpdateSingleChannel extends ChannelsEvent {
  final SocketChannelUpdateNotification data;

  UpdateSingleChannel(this.data);

  @override
  List<Object> get props => [data];
}

class LoadSingleChannel extends ChannelsEvent {
  final String channelId;
  LoadSingleChannel(this.channelId);

  @override
  List<Object> get props => [channelId];
}

class ChangeSelectedChannel extends ChannelsEvent {
  final String channelId;
  ChangeSelectedChannel(this.channelId);

  @override
  List<Object> get props => [channelId];
}

class ModifyMessageCount extends ChannelsEvent {
  final String channelId;
  final String workspaceId;
  final String companyId;
  final int unreadModifier;
  final int hasUnread;
  final int timeStamp;

  ModifyMessageCount({
    this.channelId,
    this.workspaceId,
    this.companyId,
    this.unreadModifier,
    this.hasUnread,
    this.timeStamp,
  });

  @override
  List<Object> get props => [channelId];
}

class ModifyChannelState extends ChannelsEvent {
  final String channelId;
  final String workspaceId;
  final String companyId;
  final String threadId;
  final String messageId;

  ModifyChannelState({
    this.channelId,
    this.workspaceId,
    this.companyId,
    this.threadId,
    this.messageId,
  });

  @override
  List<Object> get props => [channelId];
}

class RemoveChannel extends ChannelsEvent {
  final String workspaceId;
  final String channelId;

  RemoveChannel({this.channelId, this.workspaceId});

  @override
  List<Object> get props => [channelId];
}

class FetchMembers extends ChannelsEvent {
  final String channelId;

  FetchMembers({@required this.channelId});

  @override
  List<Object> get props => [channelId];
}
