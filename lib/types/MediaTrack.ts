/**
 * A type that represents a media track, such as a language track or closed caption text track in a video.
 *
 * @see [Android]{@link https://developers.google.com/android/reference/com/google/android/gms/cast/MediaTrack} | [iOS]{@link https://developers.google.com/cast/docs/reference/ios/interface_g_c_k_media_track}
 */
export default interface MediaTrack {
  /** The content ID of the media track. */
  contentId?: string

  /** The content type (MIME type) of the media track, or null if none was specified. */
  contentType?: string

  /** The custom data object for this media track, or null if none was specified. */
  customData?: object

  /** The unique ID of the media track. */
  id: number

  /** The language of this media track in RFC-5464 format, or null if none was specified. */
  languageCode?: string

  /** The name of the media track, or null if none was specified. */
  name?: string

  /** The text track's subtype; applies only to text tracks. One of `captions`, `chapters`, `descriptions`, `metadata`, `subtitles`. */
  subtype?: 'captions' | 'chapters' | 'descriptions' | 'metadata' | 'subtitles'

  /** The type of the track. One of `audio`, `text`, `video`. */
  type: 'audio' | 'text' | 'video'
}
