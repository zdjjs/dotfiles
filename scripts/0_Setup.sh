#!/bin/bash

defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
defaults -currentHost write com.apple.screensaver idleTime -int 600
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadPinch -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -bool false
defaults write com.apple.appstore AutoPlayVideoSetting -string "off"
defaults write com.apple.commerce AutoUpdate -bool true
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true
defaults write com.apple.commerce InAppReviewEnabled -bool false
defaults write com.apple.dashboard mcx-disabled -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock springboard-columns -int 10
defaults write com.apple.dock springboard-rows -int 6
defaults write com.apple.dock tilesize -int 16
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowTabView -bool true
defaults write com.apple.finder SidebarDevicesSectionDisclosedState -bool true
defaults write com.apple.finder SidebarPlacesSectionDisclosedState -bool true
defaults write com.apple.finderSidebarSharedSectionDisclosedState -bool true
defaults write com.apple.helpviewer DevMode -bool true
defaults write com.apple.HIToolbox AppleDictationAutoEnable -bool false
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.clock DateFormat -string "M\\U6708d\\U65e5(EEE)  H:mm:ss"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture location ~/Pictures
defaults write com.apple.screencapture show-thumbnail -bool false
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write -globalDomain AppleEnableMenuBarTransparency -bool false
defaults write -globalDomain AppleEnableSwipeNavigateWithScrolls -bool false
defaults write -globalDomain AppleKeyboardUIMode -int 3
defaults write -globalDomain AppleScrollerPagingBehavior -bool true
defaults write -globalDomain AppleShowAllExtensions -bool true
defaults write -globalDomain AppleShowScrollBars -string "Always"
defaults write -globalDomain com.apple.swipescrolldirection -bool false
defaults write -globalDomain com.apple.trackpad.forceClick -bool false
defaults write -globalDomain InitialKeyRepeat -int 25
defaults write -globalDomain KeyRepeat -int 2
defaults write -globalDomain MultipleSessionEnabled -bool false
defaults write -globalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write -globalDomain NSDisableAutomaticTermination -bool true
defaults write -globalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write -globalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write -globalDomain NSQuitAlwaysKeepsWindows -bool false
defaults write -globalDomain NSRequiresAquaSystemAppearance -bool true
defaults write -globalDomain PMPrintingExpandedStateForPrint -bool true
defaults write -globalDomain ShowExternalHardDrivesOnDesktop -bool false
defaults write -globalDomain ShowRemovableMediaOnDesktop -bool false
sudo spctl --master-disable
sudo systemsetup -setrestartfreeze on

keyboardid=$(ioreg -r -n 'Apple Internal Keyboard / Trackpad' | grep -E 'idVendor|idProduct' | head -2 | awk '{ print $4 }' | paste -s -d'-\n' -)'-0'
defaults -currentHost write -g com.apple.keyboard.modifiermapping.${keyboardid} -array-add '
<dict>
  <key>HIDKeyboardModifierMappingDst</key>
  <integer>30064771299</integer>
  <key>HIDKeyboardModifierMappingSrc</key>
  <integer>30064771129</integer>
</dict>
'
