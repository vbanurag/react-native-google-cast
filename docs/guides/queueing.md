---
id: queueing
title: Queueing
sidebar_label: Queueing
---

The Cast framework provides queueing APIs that support the creation of lists of content items, such as video or audio streams, to play sequentially on the Cast receiver. The queue of content items may be edited, reordered, updated, and so forth.

> Note: Review the [Google Cast Autoplay UX Guidelines](https://developers.google.com/cast/downloads/GoogleCastAutoplayUXGuidelines.pdf) for best practices when designing an autoplay/queueing experience for Cast.

The Cast Receiver SDK maintains the queue and responds to operations on the queue as long as the queue has at least one item currently active (playing or paused). Senders can join the session and add items to the queue. The receiver maintains a session for queue items until the last item completes playback or the sender stops the playback and terminates the session, or until a sender loads a new queue on the receiver. The receiver does not maintain any information about terminated queues by default. Once the last item in the queue finishes, the media session ends and the queue vanishes.

> Note: The [styled media receiver](https://developers.google.com/cast/docs/styled_receiver) and [default media receiver](https://developers.google.com/cast/docs/caf_receiver/) do not support a queue of images; only a queue of audio or video streams is supported in the styled and default receivers.

## Create and load media queue items

A media queue item is represented in the Cast framework as a [MediaQueueItem](api/MediaQueueItem.md) instance. When you create a media queue item, if you are using the Media Player Library with adaptive content, you can set the preload time so that the player can begin buffering the media queue item before the item ahead of it in the queue finishes playing. Setting the item's autoplay attribute to true allows the receiver to play it automatically. You can create your media queue item as follows:

```js
var mediaQueueItem = new MediaQueueItem({
  mediaInfo: new MediaInfo({
    contentId: 'https://...',
  }),
  autoplay: true,
  preloadTime: 8.0,
})
```

Load an array of media queue items in the queue by using the appropriate queueLoadItems method of the [RemoteMediaClient](api/RemoteMediaClient.md) class.

## Receive media queue status update

When the receiver loads a media queue item, it assigns a unique ID to the item which persists for the duration of the session (and the life of the queue). You can learn the status of the queue indicating which item is currently loaded (it might not be playing), loading, or preloaded. You can also get an ordered list of all the items in the queue. The GCKMediaStatus class provides this status information:

- preloadedItemID property - The ID of the item that is currently preloaded, if any.
- loadingItemID property - The ID of the item that is currently loading,
- currentItemID property - The ID of the current queue item, if any.
- queueItemCount method - Returns the number of items in the playback queue.
- queueItemAtIndex method - Returns the item at the specified index in the playback queue.

Use these members together with the other media status members to inform your app about the status of the queue and the items in the queue. In addition to media status updates from the receiver, you can listen for changes to the queue by implementing GCKRemoteMediaClientListener.remoteMediaClientDidUpdateQueue.

> Note: To provide the best user experience, the sender app must show the next autoplay item in the queue in the sender UI.

## Edit the queue

To work with the items in the queue, use the queue methods of [RemoteMediaClient](api/RemoteMediaClient.md). you have several APIs. These let you load an array of items into a new queue, insert items into an existing queue, update the properties of items in the queue, make an item jump forward or backward in the queue, set the properties of the queue itself (for example, change the repeatMode that selects the next item), remove items from the queue, and reorder the items in the queue.
