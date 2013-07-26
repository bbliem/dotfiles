import XMonad
import Data.Monoid
import System.Exit
 
import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import Control.Monad (liftM2)

import XMonad.Actions.CycleWS
import XMonad.Actions.UpdatePointer
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.LayoutHints
import XMonad.Config.Xfce
import XMonad.Util.WorkspaceCompare
import XMonad.Actions.FindEmptyWorkspace
 
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    , ((mod1Mask,           xK_F3    ), spawn $ XMonad.terminal conf)
    , ((modm,               xK_c     ), updatePointer (Relative 0.5 0.5))
    , ((mod1Mask,           xK_F2    ), spawn "xfrun4")
    , ((mod1Mask,           xK_F4    ), kill)
    , ((modm,               xK_space ), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf) -- Reset to default layout
    , ((modm,               xK_n     ), refresh) -- Resize viewed windows to the correct size
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((mod1Mask,           xK_Tab   ), windows W.focusDown)
    , ((0,                  xK_Menu  ), windows W.focusDown)
    , ((modm,               xK_j     ), windows W.focusDown)
    , ((modm,               xK_k     ), windows W.focusUp)
    , ((modm .|. shiftMask,     xK_Tab), windows W.focusUp)
    , ((mod1Mask .|. shiftMask, xK_Tab), windows W.focusUp)
    , ((shiftMask,              xK_Menu), windows W.focusUp)
    , ((modm,               xK_Return), windows W.focusMaster)
    , ((modm,               xK_KP_Enter), windows W.focusMaster)
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_KP_Enter), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown)
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp)
    , ((modm,               xK_h     ), sendMessage Shrink)
    , ((modm,               xK_l     ), sendMessage Expand)
    , ((modm,               xK_t     ), withFocused $ windows . W.sink) -- Push window back into tiling
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
    -- Go to an empty workspace
    , ((modm,               xK_m     ), viewEmptyWorkspace)
--    , ((modm,               xK_m     ), moveTo Next EmptyWS)
--    , ((modm, xK_m), do t <- findWorkspace getSortByIndex Next EmptyWS 1; windows . W.view $ t)

    -- Move focused window to an empty workspace
    , ((modm .|. shiftMask, xK_m     ), tagToEmptyWorkspace)
--    , ((modm .|. shiftMask, xK_m     ), do t <- findWorkspace getSortByIndex Next EmptyWS 1; windows . W.shift $ t; windows . W.view $ t)

    -- a basic CycleWS setup
    , ((modm,               xK_Right),  nextWS)
    , ((modm,               xK_Left),   prevWS)
    , ((modm .|. shiftMask, xK_Right),  shiftToNext >> nextWS)
    , ((modm .|. shiftMask, xK_Left),   shiftToPrev >> prevWS)
--    , ((modm, xK_Right), do t <- findWorkspace getSortByIndex Next AnyWS nScreens; windows . W.view $ t)
--    , ((modm, xK_Left), do t <- findWorkspace getSortByIndex Prev AnyWS nScreens; windows . W.view $ t)
--    , ((modm .|. shiftMask, xK_Right), do t <- findWorkspace getSortByIndex Next AnyWS nScreens; windows . W.shift $ t; windows . W.view $ t)
--    , ((modm .|. shiftMask, xK_Left), do t <- findWorkspace getSortByIndex Prev AnyWS nScreens; windows . W.shift $ t; windows . W.view $ t)
    , ((modm,               xK_Down),   nextScreen)
    , ((modm,               xK_Up),     prevScreen)
    , ((modm .|. shiftMask, xK_Down),   shiftNextScreen >> nextScreen)
    , ((modm .|. shiftMask, xK_Up),     shiftPrevScreen >> prevScreen)
    , ((modm,               xK_z),      toggleWS)
    , ((modm,               xK_KP_Insert), toggleWS)
    , ((0,                  0x1008FF11), spawn "amixer set Master 5%- unmute; ~/.volume-notification.sh")
    , ((0,                  0x1008FF13), spawn "amixer set Master 5%+ unmute; ~/.volume-notification.sh")
    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]
 
myLayout = layoutHints $ spacing 2 $ avoidStruts $ tiled ||| Mirror tiled ||| Full
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio
    -- The default number of windows in the master pane
    nmaster = 1
    -- Default proportion of screen occupied by master pane
    ratio   = 64/100
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100
 
------------------------------------------------------------------------
-- Window rules:
 
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
myManageHook = composeAll
-- Allows focusing other monitors without killing the fullscreen
--  [ isFullscreen --> (doF W.focusDown <+> doFullFloat)
-- Single monitor setups, or if the previous hook doesn't work
    [ isFullscreen --> doFullFloat
    , className =? "Firefox"         --> viewShift "web"
    , className =? "Thunderbird"     --> viewShift "mail"
    , className =? "Chromium"        --> viewShift "mail"
    , className =? "Pidgin"          --> viewShift "mail"
    , className =? "Skype"           --> viewShift "mail"
    , className =? "Quodlibet"       --> viewShift "music"
    , className =? "MPlayer"         --> doFloat
    , className =? "Gimp"            --> doFloat
    , className =? "Xfce4-appfinder" --> doFloat
    , className =? "Xfrun4"          --> doFloat
    , className =? "Xfce4-notifyd"   --> doIgnore
    , resource  =? "desktop_window"  --> doIgnore
    , resource  =? "kdesktop"        --> doIgnore ]
    where viewShift = doF . liftM2 (.) W.greedyView W.shift
 
--main = xmonad $ ewmh defaults
main = xmonad $ ewmh xfceConfig {
    -- simple stuff
    terminal           = "xfce4-terminal",
    focusFollowsMouse  = True,
    borderWidth        = 2,
    modMask            = mod4Mask,
    workspaces         = ["web", "2", "3", "mail", "music"],
    normalBorderColor  = "#dddddd",
    focusedBorderColor = "#3ea35e",
 
    -- key bindings
    keys               = myKeys,
    mouseBindings      = myMouseBindings,
 
    -- hooks, layouts
    layoutHook         = smartBorders (myLayout), -- Don't put borders on fullFloatWindows
    manageHook         = myManageHook <+> manageDocks,
    handleEventHook    = fullscreenEventHook
    }

-- vim:expandtab
