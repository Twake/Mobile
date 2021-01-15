import 'package:equatable/equatable.dart';
import 'package:twake/models/base_channel.dart';
import 'package:twake/models/message.dart';

abstract class MessagesState extends Equatable {
  final BaseChannel parentChannel;
  final Message threadMessage;
  const MessagesState({this.parentChannel, this.threadMessage});
}

class MessagesLoading extends MessagesState {
  const MessagesLoading({BaseChannel parentChannel, Message threadMessage})
      : super(parentChannel: parentChannel, threadMessage: threadMessage);

  @override
  List<Object> get props => [];
}

class MessagesLoaded extends MessagesState {
  final List<Message> messages;
  final int messageCount;
  final Message threadMessage;

  const MessagesLoaded({
    this.messageCount,
    this.messages,
    this.threadMessage,
    BaseChannel parentChannel,
  }) : super(parentChannel: parentChannel, threadMessage: threadMessage);

  @override
  List<Object> get props => [messageCount, messages, parentChannel];
}

class MoreMessagesLoading extends MessagesLoaded {
  const MoreMessagesLoading({
    List<Message> messages,
    BaseChannel parentChannel,
  }) : super(
          messageCount: messages.length,
          messages: messages,
          parentChannel: parentChannel,
        );
}

class MessagesEmpty extends MessagesState {
  const MessagesEmpty({BaseChannel parentChannel, Message threadMessage})
      : super(parentChannel: parentChannel, threadMessage: threadMessage);

  @override
  List<Object> get props => [parentChannel, threadMessage];
}

class MessageSelected extends MessagesLoaded {
  final Message threadMessage;
  final responsesCount;

  const MessageSelected({
    this.threadMessage,
    this.responsesCount,
    List<Message> messages,
    BaseChannel parentChannel,
  }) : super(
          messages: messages,
          messageCount: messages.length,
          threadMessage: threadMessage,
          parentChannel: parentChannel,
        );

  @override
  List<Object> get props => [threadMessage, responsesCount];
}
