@interface SBLockScreenManager : NSObject
+(id)sharedInstance;
-(void)_wakeScreenForTapToWake;
@end

@interface SBCoverSheetPresentationManager : NSObject
+ (id)sharedInstance;
- (BOOL)isPresented;
@end

@interface SBMediaController  : NSObject
-(void)_mediaRemoteNowPlayingInfoDidChange:(id)arg1;
@end

%hook SBMediaController
-(void)_mediaRemoteNowPlayingInfoDidChange:(id)arg1 {
    %orig;
    if ([[%c(SBCoverSheetPresentationManager) sharedInstance] isPresented]) {
        [[%c(SBLockScreenManager) sharedInstance] _wakeScreenForTapToWake];
    }
}
%end
