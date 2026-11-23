#Requires AutoHotkey v2.0
#SingleInstance Off
#Warn All, OutputDebug

#Include <Explorer>

ProjectMenu() {
    items := ProjectMenu_Editor(false)
    items.Push("-", ProjectMenu_Readme(), "-")
    items.Push({ text: "&Sync with Upstream`tS", id: "OnSyncWithUpstream", run: OnSyncWithUpstream, icon: "@ConEmuPath" })
    items.Push("-")
    items.Push(ProjectMenu_EditMenu()*)
    return items
}

OnSyncWithUpstream() => SyncWithUpstream(Explorer2_ProjectDir(), "https://github.com/langchain-ai/langchain.git", "master")

Explorer2_Main(ProjectMenu)
