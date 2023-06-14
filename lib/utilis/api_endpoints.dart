const _domainName = 'famouslive.herokuapp.com';
const kDomain = 'https://famouslive.herokuapp.com';
const _baseUrl = '$kDomain/api/v1';
//Auth
const kLoginUrl = '$_baseUrl/auth/token/';
const kRegisterWithProfileUrl = '$_baseUrl/auth/register-with-profile-create/';
const kLogoutUrl = '$_baseUrl/auth/logout/';
const kChangePasswordUpdateUrl = '$_baseUrl/auth/change-password/';
const kPasswordResetOtpGenerateCreateUrl =
    '$_baseUrl/auth/password-reset-otp-create/';
const kResetPasswordWithOtpUpdateUrl = '$_baseUrl/auth/reset-password/';
// Balance
const kPaymentMethodListUrl = '$_baseUrl/balance/payment-method-list/';
const kBalanceRetrieveUrl = '$_baseUrl/balance/balance-retrieve/';
const kDepositHistoryListUrl = '$_baseUrl/balance/deposit-request-list/';
const kDepositRequestCreateUrl = '$_baseUrl/balance/deposit-request-create/';
const kWithdrawHistoryUrl = '$_baseUrl/balance/withdraw-request-list/';
const kWithdrawRequestCreateUrl = '$_baseUrl/balance/withdraw-request-create/';

// Earn
const kEarnCoinExchangerRetrieveUrl =
    '$_baseUrl/balance/earn-coin-exchanger-retrieve/';
String kContributionRankingListUrl(int userId) =>
    '$_baseUrl/balance/contribution-ranking-list/$userId/';

// Plan
const kPlanListUrl = '$_baseUrl/balance/plan-list/';
const kPurchasedPlanListUrl = '$_baseUrl/balance/purchased-plan-list/';
const kPlanPurchasedCreateUrl = '$_baseUrl/balance/plan-purchased-create/';
const kCheckForStreamingAllowedUrl =
    '$_baseUrl/balance/check-for-streaming-allowed/';
const kEarningHistoryListUrl = '$_baseUrl/balance/earning-history-list/';

//Post
const kNewsfeedUrl = '$_baseUrl/posts/newsfeed/';
String kNewsFeedPostRetrieveUrl(int postId) =>
    '$_baseUrl/posts/news-feed-post-retrieve/$postId/';
const kPostCreateUrl = '$_baseUrl/posts/post-create/';
String kPostEditUrl(int id) => '$_baseUrl/posts/post-update/$id/';
String kPostCommentCreateUrl(int postId) =>
    '$_baseUrl/posts/post-comment-create/$postId/';
String kPostDeleteUrl(int postId) => '$_baseUrl/posts/post-delete/$postId/';
// # Perform both add and remove
String kLikeCreateUrl(int id) => '$_baseUrl/posts/like-create/$id/';

// Profile
String kProfileRetrieveUrl(int userId) =>
    '$_baseUrl/profiles/profile-retrieve/$userId/';
String kProfileUpdateUrl = '$_baseUrl/profiles/self-profile-update/';
// # Perform both add and remove
String kFollowerCreateUrl(int uid) =>
    '$_baseUrl/profiles/follower-create/$uid/';

//Stories
const kCoverStoryListUrl = '$_baseUrl/posts/stories/cover-story-list/';
const kStoryCreateUrl = '$_baseUrl/posts/stories/story-create/';

// Agora Token
String kAgoraRtcTokenRetrieveUrl({channelName, role, uid}) =>
    '$_baseUrl/live-streamings/agora-rtc-token-retrieve/?channel_name=$channelName&role=$role&uid=$uid';
//FCM stuffs
const kFCMDeviceCreateUrl = '$_baseUrl/fcm/device-create/';
const kFCMUserTokenUpdateUrl = '$_baseUrl/fcm/token-update/';
const kFCMPeerDeviceUpdateUrl = '$_baseUrl/fcm/peer-device-update/';
const kFCMSinglePushCreate = '$_baseUrl/fcm/single-push-create/';
const kFCMSinglePushForCallingCreate =
    '$_baseUrl/fcm/single-push-for-calling-create/';

// Call Histories
const kCallHistoryListUrl = '$_baseUrl/call-histories/call-history-list/';
const kCallHistoryCreateUrl = '$_baseUrl/call-histories/call-history-create/';

// Live Streaming
const kLiveStreamingStateUpdateUrl =
    '$_baseUrl/live-streamings/live-streaming-state-update/';
const kLiveStreamingCommentCreateUrl =
    '$_baseUrl/live-streamings/live-streaming-comment-create/';
const kLiveStreamingGiftCreateUrl =
    '$_baseUrl/live-streamings/live-streaming-gift-create/';
const kLiveStreamingActionCreateUrl =
    '$_baseUrl/live-streamings/live-streaming-action-create/';
// Notify followers with FCM
const kLiveStreamingNotifyFollowersCreateUrl =
    '$_baseUrl/live-streamings/notify-followers-create/';
//New
const kLiveStreamingFlySMSCreateUrl =
    '$_baseUrl/live-streamings/live-streaming-comment-create/';

// Websocket
String kWebSocketLiveStreamingUrl(roomName) {
  print(roomName);
  print('wss://famouslive.herokuapp.com/ws/live-streaming/$roomName/');
  return 'wss://famouslive.herokuapp.com/ws/live-streaming/$roomName/';
}
//new apis

const kAddFriend = '$_baseUrl/profiles/friends/';
const kBlockFriend = '$_baseUrl/profiles/block/';
String kunBlocked(int id) => '$_baseUrl/profiles/block/$id/';
const kSupport = '$_baseUrl/auth/Supports/';

//New
const kFriendList = '$_baseUrl/profiles/friends/';
const kBlockedList = '$_baseUrl/profiles/block/';
const kFollowerList = '$_baseUrl/profiles/followers/';
String kunFollow(int id) => '$_baseUrl/profiles/followers/$id/';

//profile
const kProfileUpdate = '$_baseUrl/profiles/self-profile-update/';
String kRetriveProfile(int id) => '$_baseUrl/profiles/profile-retrieve/$id/';
String checkFollow(int id) => '$_baseUrl/profiles/is_followed/$id/';

//User assets
const kUserAsset = '$_baseUrl/profiles/profile_assets/';
const kAssetsList = '$_baseUrl/profiles/assets/';
