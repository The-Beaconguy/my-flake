{
  inputs,
  lib,
  username,
  programoptions,
  flakedir,
  ...
}: {
  home-manager.users.${username} = {
    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];
    # configure options
    programs.noctalia-shell = {
      enable = true;
      # mkForce required due to conflicting defaults (1.0 in nix-store vs 1 in noctalia.nix) im sure there is a better way.
      settings = lib.mkForce {
        # options only for v5
        #theme = {
        #  mode = "dark";
        #  source = "custom";
        #  custom_pallette = "mytheme";
        #};
        appLauncher = {
          customLaunchPrefix = "";
          customLaunchPrefixEnabled = false;
          enableClipPreview = true;
          enableClipboardHistory = false;
          iconMode = "tabler";
          pinnedExecs = [];
          position = "center";
          showCategories = true;
          sortByMostUsed = true;
          terminalCommand = "kitty -e";
          useApp2Unit = false;
          viewMode = "list";
        };
        audio = {
          cavaFrameRate = 30;
          externalMixer = "pwvucontrol || pavucontrol";
          mprisBlacklist = [];
          preferredPlayer = "";
          visualizerType = "linear";
          volumeOverdrive = false;
          volumeStep = 5;
        };
        bar = {
          capsuleOpacity = 1;
          density = "default";
          exclusive = true;
          useSeparateOpacity = true;
          backgroundOpacity = "0.8300000000000001";
          floating = false;
          marginHorizontal = 0.25;
          marginVertical = 0.25;
          monitors = [];
          outerCorners = true;
          position = "bottom";
          showCapsule = false;
          showOutline = false;
          transparent = false;
          widgets = {
            center = [];
            left = [
              {
                colorizeDistroLogo = true;
                colorizeSystemIcon = "primary";
                customIconPath = "none";
                enableColorization = true;
                icon = "arrow-badge-right-filled";
                id = "ControlCenter";
                useDistroLogo = true;
              }
              {
                characterCount = 2;
                colorizeIcons = false;
                enableScrollWheel = true;
                followFocusedScreen = false;
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "none";
                showApplications = false;
                showLabelsOnlyWhenOccupied = true;
              }
              {
                id = "plugin:mawaqit";
                city = "Riyadh";
                country = "SA";
                method = 4;
                showCountdown = true;
                showNotifications = true;
                playAzan = false;
                azanFile = "azan1.mp3";
                school = 0;
                hijriDayOffset = 0;
                weekStartDay = 0;
                textColor = "secondary";
                iconColor = "primary";
                activeColor = "primary";
              }
              {
                id = "plugin:kde-connect";
              }
              {
                id = "LockKeys";
                showCapsLock = true;
                hideWhenOff = true;
                showNumLock = false;
                showScrollLock = false;
              }
              {
                id = "plugin:tamagotchi";
                volume = 0;
                difficulty = 0;
                showDebug = false;
                showPercentage = false;
              }
              {
                id = "plugin:show-keys";
                captureEnabled = true;
                evtestDevice = "/dev/input/event5";
                useCustomColors = true;
                position = "bottom";
                marginPx = 60;
                hideDelaySec = 2;
                disabledScreens = [];
                pillColor = "#9ccfd8"; # Secondary
                pillBg = "#232136"; # Surface
              }
            ];
            right = [
              {
                hideWhenZero = false;
                id = "NotificationHistory";
                showUnreadBadge = false;
                iconColor = "primary";
                textColor = "primary";
              }
              {
                displayMode = "alwaysHide";
                id = "Volume";
                iconColor = "primary";
                textColor = "primary";
              }
              {
                deviceNativePath = "";
                displayMode = "onhover";
                hideIfNotDetected = true;
                id = "Battery";
                showNoctaliaPerformance = false;
                showPowerProfiles = false;
                warningThreshold = 30;
              }
              {
                displayMode = "alwaysHide";
                id = "Microphone";
                iconColor = "primary";
                textColor = "primary";
              }
              {
                displayMode = "forceOpen";
                id = "KeyboardLayout";
                iconColor = "secondary";
                textColor = "secondary";
              }
              {
                id = "Clock";
                customFont = "";
                formatHorizontal = "HH:mm ddd, MMM dd";
                formatVertical = "HH mm - dd MM";
                clockColor = "secondary";
                useCustomFont = false;
                usePrimaryColor = true;
              }
              {
                id = "Tray";
                blacklist = [];
                colorizeIcons = true;
                chevronColor = "error";
                drawerEnabled = true;
                hidePassive = false;
                pinned = [];
              }
              {
                id = "plugin:catwalk";
              }
              {
                id = "plugin:screen-recorder";
                hideInactive = false;
                iconColor = "primary";
                directory = "";
                filenamePattern = "recording_yyyyMMdd_HHmmss";
                frameRate = "custom";
                customFrameRate = "170";
                audioCodec = "opus";
                videoCodec = "h264";
                quality = "very_high";
                colorRange = "limited";
                showCursor = true;
                copyToClipboard = false;
                audioSource = "both";
                videoSource = "portal";
                resolution = "original";
              }
            ];
          };
        };
        brightness = {
          brightnessStep = 5;
          enableDdcSupport = false;
          enforceMinimum = true;
        };
        calendar = {
          cards = [
            {
              enabled = true;
              id = "calendar-header-card";
            }
            {
              enabled = true;
              id = "calendar-month-card";
            }
            {
              enabled = true;
              id = "timer-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
          ];
        };
        colorSchemes = {
          darkMode = true;
          generateTemplatesForPredefined = true;
          manualSunrise = "06:30";
          manualSunset = "18:30";
          matugenSchemeType = "";
          predefinedScheme = "Rose pine moon";
          schedulingMode = "off";
          useWallpaperColors = false;
        };
        controlCenter = {
          cards = [
            {
              enabled = true;
              id = "profile-card";
            }
            {
              enabled = true;
              id = "shortcuts-card";
            }
            {
              enabled = true;
              id = "audio-card";
            }
            {
              enabled = false;
              id = "brightness-card";
            }
            {
              enabled = true;
              id = "weather-card";
            }
            {
              enabled = true;
              id = "media-sysmon-card";
            }
          ];
          position = "close_to_bar_button";
          shortcuts = {
            left = [
              {id = "WiFi";}
              {id = "Bluetooth";}
              {id = "ScreenRecorder";}
            ];
            right = [
              {id = "Notifications";}
              {id = "PowerProfile";}
            ];
          };
        };
        desktopWidgets = {
          enabled = false;
          gridSnap = false;
          monitorWidgets = [
            {
              name = "DP-2";
              widgets = [];
            }
          ];
        };
        dock = {
          animationSpeed = 2;
          backgroundOpacity = 1;
          colorizeIcons = false;
          deadOpacity = 0.6;
          displayMode = "auto_hide";
          enabled = true;
          floatingRatio = 1;
          inactiveIndicators = false;
          monitors = [];
          onlySameOutput = true;
          pinnedApps = [];
          pinnedStatic = false;
          size = 1;
        };
        general = {
          allowPanelsOnScreenWithoutBar = true;
          animationDisabled = false;
          animationSpeed = 1;
          avatarImage = "/home/${username}/.face.icon";
          boxRadiusRatio = 1;
          compactLockScreen = false;
          dimmerOpacity = 0.15;
          enableShadows = true;
          forceBlackScreenCorners = false;
          iRadiusRatio = 1;
          language = "";
          lockOnSuspend = true;
          radiusRatio = 1;
          scaleRatio = 1;
          screenRadiusRatio = 1;
          shadowDirection = "bottom_right";
          shadowOffsetX = 2;
          shadowOffsetY = 3;
          showHibernateOnLockScreen = false;
          showScreenCorners = false;
          showSessionButtonsOnLockScreen = true;
        };
        hooks = {
          darkModeChange = "";
          enabled = false;
          performanceModeDisabled = "";
          performanceModeEnabled = "";
          screenLock = "";
          screenUnlock = "";
          wallpaperChange = "";
        };
        location = {
          name = "Riyadh";
          analogClockInCalendar = false;
          firstDayOfWeek = -1;
          showCalendarEvents = true;
          showCalendarWeather = true;
          showWeekNumberInCalendar = false;
          use12hourFormat = false;
          useFahrenheit = false;
          weatherEnabled = true;
          weatherShowEffects = true;
        };
        network = {wifiEnabled = true;};
        nightLight = {
          autoSchedule = true;
          dayTemp = "6500";
          enabled = false;
          forced = false;
          manualSunrise = "06:30";
          manualSunset = "18:30";
          nightTemp = "4000";
        };
        notifications = {
          backgroundOpacity = 1;
          criticalUrgencyDuration = 15;
          enableKeyboardLayoutToast = true;
          enabled = true;
          location = "top_right";
          lowUrgencyDuration = 8;
          monitors = [];
          normalUrgencyDuration = 8;
          overlayLayer = true;
          respectExpireTimeout = false;
          sounds = {
            criticalSoundFile = "";
            enabled = true;
            excludedApps = "discord,firefox,chrome,chromium,edge";
            lowSoundFile = "";
            normalSoundFile = "";
            separateSounds = false;
            volume = 0.5;
          };
        };
        osd = {
          autoHideMs = 3000;
          backgroundOpacity = 1;
          enabled = true;
          enabledTypes = [
            0
            1
            2
            4
          ];
          location = "bottom";
          monitors = [];
          overlayLayer = true;
        };
        #screenRecorder = {
        # audioCodec = "opus";
        #  audioSource = "default_output";
        #  colorRange = "limited";
        #  directory = "/home/${username}/Videos";
        #  frameRate = 60;
        #  quality = "very_high";
        #  showCursor = true;
        #  videoCodec = "h264";
        #  videoSource = "portal";
        # };
        sessionMenu = {
          countdownDuration = 10000;
          enableCountdown = true;
          largeButtonsStyle = false;
          position = "center";
          powerOptions = [
            {
              action = "lock";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "suspend";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "hibernate";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "reboot";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "logout";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
            {
              action = "shutdown";
              command = "";
              countdownEnabled = true;
              enabled = true;
            }
          ];
          showHeader = true;
        };
        settingsVersion = 32;
        systemMonitor = {
          cpuCriticalThreshold = 90;
          cpuPollingInterval = 3000;
          cpuWarningThreshold = 80;
          criticalColor = "";
          diskCriticalThreshold = 90;
          diskPollingInterval = 3000;
          diskWarningThreshold = 80;
          enableDgpuMonitoring = false;
          gpuCriticalThreshold = 90;
          gpuPollingInterval = 3000;
          gpuWarningThreshold = 80;
          memCriticalThreshold = 90;
          memPollingInterval = 3000;
          memWarningThreshold = 80;
          networkPollingInterval = 3000;
          tempCriticalThreshold = 90;
          tempPollingInterval = 3000;
          tempWarningThreshold = 80;
          useCustomColors = false;
          warningColor = "";
        };
        templates = {
          alacritty = false;
          cava = false;
          code = false;
          discord = false;
          emacs = false;
          enableUserTemplates = false;
          foot = false;
          fuzzel = false;
          ghostty = false;
          gtk = false;
          helix = false;
          hyprland = false;
          kcolorscheme = false;
          kitty = false;
          mango = false;
          niri = false;
          pywalfox = true;
          qt = false;
          spicetify = false;
          telegram = false;
          vicinae = false;
          walker = false;
          wezterm = false;
          yazi = false;
          zed = false;
          activeTemplates = {
            id = "pywalfox";
            enabled = true;
          };
        };
        ui = {
          bluetoothDetailsViewMode = "grid";
          bluetoothHideUnnamedDevices = false;
          fontDefault = "Montserrat";
          fontDefaultScale = 1;
          fontFixed = "JetBrainsMono Nerd Font Mono";
          fontFixedScale = 1;
          panelBackgroundOpacity = 1;
          panelsAttachedToBar = true;
          settingsPanelMode = "attached";
          tooltipsEnabled = true;
          wifiDetailsViewMode = "grid";
        };
        wallpaper = {
          #default.path = "purple-dark--arabic-letters.png";
          directory = "/home/${username}/${flakedir}/hmModules/wallpapers";
          enableMultiMonitorDirectories = false;
          enabled = programoptions.wm == "niri";
          fillColor = "#000000";
          fillMode = "crop";
          hideWallpaperFilenames = false;
          monitorDirectories = [];
          overviewEnabled = false;
          panelPosition = "follow_bar";
          randomEnabled = true;
          randomIntervalSec = 300;
          recursiveSearch = false;
          setWallpaperOnAllMonitors = true;
          transitionDuration = 1500;
          transitionEdgeSmoothness = 0.05;
          transitionType = "random";
          useWallhaven = false;
          wallhavenCategories = "111";
          wallhavenOrder = "desc";
          wallhavenPurity = "100";
          wallhavenQuery = "";
          wallhavenRatios = "";
          wallhavenResolutionHeight = "";
          wallhavenResolutionMode = "atleast";
          wallhavenResolutionWidth = "";
          wallhavenSorting = "relevance";
        };
      };
    };
  };
}
