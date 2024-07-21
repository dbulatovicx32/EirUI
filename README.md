# EirUI
EirUI is a pfUI based 1.12 AddOns compilation

## EirUI v0.1.0 - (pfUI, shaguDps, TWThreat reskin)
-# *installation is a bit scuffed for now, ideally in the future you could just use the import code i provide without needing my changes, will work on that, this is just a testing phase lets say*

**Install Guide:**
* Backup your own Interface & WTF folders, you can create and put them in a **Ui_Backup** folder or smth.

> * Extract Interface & WTF folders from EirUI zip.
>  * Grab the** Config.wtf from your Ui_Backup** folder and paste it into EirUI's WTF. This is to preserve your sound, graphics, etc... settings.

> * Replace **bolded** folder names with those in your **Ui_Backup**:
>  * WTF > Account > **account_name_here** > **server_name_here** > **character_name_here**
>  * for example : WTF > Account > MyAccount > Nordanaar > MyCharacter

> * To preserve your macros, bindings and **pfQuest**, copy these files from your **Ui_Backup**:
>  * WTF > Account: **bindings-cache.wtf**, **macros-cache.txt**, **macros-local.txt**
>  * WTF > Account > *Server *> *Character*: **bindings-cache.wtf**, **macros-cache.txt**, **macros-local.txt**
>  * WTF > Account > SavedVariables: all files starting with pfQuest
>  * WTF > Account > *Server *> *Character* > Saved Variables: all files starting with pfQuest

If you want to move TWT & shaguDPS and not have them docked:
* pfUI > Thirdparty: **uncheck ShaguDPS (Dock) and TW Threatmeter (Dock)**
