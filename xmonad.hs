-- xmonad example config file for xmonad-0.9
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
-- NOTE: Those updating from earlier xmonad versions, who use
-- EwmhDesktops, safeSpawn, WindowGo, or the simple-status-bar
-- setup functions (dzen, xmobar) probably need to change
-- xmonad.hs, please see the notes below, or the following
-- link for more details:
--
-- http://www.haskell.org/haskellwiki/Xmonad/Notable_changes_since_0.8
--
 
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
import XMonad.Layout.IndependentScreens
import XMonad.Config.Xfce
import XMonad.Util.WorkspaceCompare
 
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "xfce4-terminal"
 
-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
 
-- Width of the window border in pixels.
--
myBorderWidth   = 2
 
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod4Mask

-- NOTE: from 0.9.1 on numlock mask is set automatically. The numlockMask
-- setting should be removed from configs.
--
-- You can safely remove this even on earlier xmonad versions unless you
-- need to set it to something other than the default mod2Mask, (e.g. OSX).
--
-- The mask for the numlock key. Numlock status is "masked" from the
-- current modifier status, so the keybindings will work with numlock on or
-- off. You may need to change this on some systems.
--
-- You can find the numlock modifier by running "xmodmap" and looking for a
-- modifier with Num_Lock bound to it:
--
-- > $ xmodmap | grep Num
-- > mod2        Num_Lock (0x4d)
--
-- Set numlockMask = 0 if you don't have a numlock key, or want to treat
-- numlock status separately.
--
-- myNumlockMask   = mod2Mask -- deprecated in xmonad-0.9.1
------------------------------------------------------------
 
 
-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
--myWorkspaces nScreens = withScreens nScreens ["web", "2", "3", "4", "5", "6", "7", "mail", "music"]
myWorkspaces nScreens = withScreens nScreens ["web", "2", "3", "mail", "music"]
 
-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#3ea35e"
 
------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys (S nScreens) conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 
    -- launch a terminal
    [ ((mod1Mask,           xK_F3    ), spawn $ XMonad.terminal conf)

    , ((modm,               xK_c     ), updatePointer (Relative 0.5 0.5))
 
    -- launch dmenu
--  , ((modm,               xK_p     ), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
    , ((modm,               xK_p     ), spawn "xfrun4")
    , ((mod1Mask,           xK_F2    ), spawn "xfrun4")
 
    -- launch gmrun
--, ((modm .|. shiftMask,   xK_p     ), spawn "gmrun")
    , ((modm .|. shiftMask, xK_p     ), spawn "xfce4-appfinder")
 
    -- close focused window
    , ((modm .|. shiftMask, xK_c     ), kill)
    , ((mod1Mask,           xK_F4    ), kill)
 
     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)
 
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
 
    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)
 
    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)
    , ((mod1Mask,           xK_Tab   ), windows W.focusDown)
    , ((0,                  xK_Menu  ), windows W.focusDown)
 
    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)
 
    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the previous window
    , ((modm .|. shiftMask,     xK_Tab), windows W.focusUp  )
    , ((mod1Mask .|. shiftMask, xK_Tab), windows W.focusUp  )
    , ((shiftMask,              xK_Menu), windows W.focusUp )
 
    -- Move focus to the master window
    , ((modm,               xK_Return), windows W.focusMaster  )
    , ((modm,               xK_KP_Enter), windows W.focusMaster  )
 
    -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)
    , ((modm .|. shiftMask, xK_KP_Enter), windows W.swapMaster  )
 
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )
 
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )
 
    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)
 
    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)
 
    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
 
    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
 
    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Go to an empty workspace
    --, ((modm,               xK_m     ), viewEmptyWorkspace)
--    , ((modm,               xK_m     ), moveTo Next EmptyWS)
    , ((modm, xK_m), do t <- findWorkspace getSortByIndex Next EmptyWS 1; windows . W.view $ t)

    -- Move focused window to an empty workspace
    --, ((modm .|. shiftMask, xK_m     ), tagToEmptyWorkspace)
--    , ((modm .|. shiftMask, xK_m     ), do t <- findWorkspace getSortByIndex Next EmptyWS 1; windows . W.shift $ t; windows . W.view $ t)
    , ((modm .|. shiftMask, xK_m     ), do t <- findWorkspace getSortByIndex Next EmptyWS 1; windows . W.shift $ t; windows . W.view $ t)

    -- a basic CycleWS setup
--    , ((modm,               xK_Right),  nextWS)
--    , ((modm,               xK_Left),   prevWS)
--    , ((modm .|. shiftMask, xK_Right),  shiftToNext >> nextWS)
--    , ((modm .|. shiftMask, xK_Left),   shiftToPrev >> prevWS)
    , ((modm, xK_Right), do t <- findWorkspace getSortByIndex Next AnyWS nScreens; windows . W.view $ t)
    , ((modm, xK_Left), do t <- findWorkspace getSortByIndex Prev AnyWS nScreens; windows . W.view $ t)
    , ((modm .|. shiftMask, xK_Right), do t <- findWorkspace getSortByIndex Next AnyWS nScreens; windows . W.shift $ t; windows . W.view $ t)
    , ((modm .|. shiftMask, xK_Left), do t <- findWorkspace getSortByIndex Prev AnyWS nScreens; windows . W.shift $ t; windows . W.view $ t)
    , ((modm,               xK_Down),   nextScreen)
    , ((modm,               xK_Up),     prevScreen)
    , ((modm .|. shiftMask, xK_Down),   shiftNextScreen >> nextScreen)
    , ((modm .|. shiftMask, xK_Up),     shiftPrevScreen >> prevScreen)
    , ((modm,               xK_z),      toggleWS)
    , ((modm,               xK_KP_Insert), toggleWS)

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)
 
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
 
    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
 
    --
    -- mod-[1..9], Switch to workspace N
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
--    [((m .|. modm, k), windows $ f i)
--        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9] ++ zip (XMonad.workspaces conf) [xK_KP_End, xK_KP_Down, xK_KP_Page_Down, xK_KP_Left, xK_KP_Begin, xK_KP_Right, xK_KP_Home, xK_KP_Up, xK_KP_Page_Up, xK_KP_Insert]
    [((m .|. modm, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip (workspaces' conf) [xK_1 .. xK_9] ++ zip (workspaces' conf) [xK_KP_End, xK_KP_Down, xK_KP_Page_Down, xK_KP_Left, xK_KP_Begin, xK_KP_Right, xK_KP_Home, xK_KP_Up, xK_KP_Page_Up, xK_KP_Insert]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
--        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]] -- maybe better for twinview with tv?
    ++
--
--    --
--    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
--    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
--    --
   [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
       | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
       , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


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
 
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]
 
------------------------------------------------------------------------
-- Layouts:
 
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- * NOTE: XMonad.Hooks.EwmhDesktops users must remove the obsolete
-- ewmhDesktopsLayout modifier from layoutHook. It no longer exists.
-- Instead use the 'ewmh' function from that module to modify your
-- defaultConfig as a whole. (See also logHook, handleEventHook, and
-- startupHook ewmh notes.)
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myLayout = spacing 2 $ avoidStruts $ tiled ||| Mirror tiled ||| Full
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
--
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
    where viewShift = doF . onCurrentScreen (liftM2 (.) W.greedyView W.shift)
 
------------------------------------------------------------------------
-- Event handling
 
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add EWMH event handling to your custom event hooks by
-- combining them with ewmhDesktopsEventHook.
--
myEventHook = fullscreenEventHook
--myEventHook = mempty
 
------------------------------------------------------------------------
-- Status bars and logging
 
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add EWMH logHook actions to your custom log hook by
-- combining it with ewmhDesktopsLogHook.
--
myLogHook = return ()
 
------------------------------------------------------------------------
-- Startup hook
 
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add initialization of EWMH support to your custom startup
-- hook by combining it with ewmhDesktopsStartup.
--
myStartupHook = return ()
 
------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.
 
-- Run xmonad with the settings you specify. No need to modify this.
--
--main = xmonad $ ewmh defaults
main = do
    nScreens <- countScreens
    xmonad $ ewmh xfceConfig {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        -- numlockMask deprecated in 0.9.1
        -- numlockMask        = myNumlockMask,
        workspaces         = myWorkspaces nScreens,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,
 
      -- key bindings
        keys               = myKeys nScreens,
        mouseBindings      = myMouseBindings,
 
      -- hooks, layouts
        layoutHook         = smartBorders (myLayout), -- Don't put borders on fullFloatWindows
        manageHook         = myManageHook <+> manageDocks,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }

-- vim:expandtab
