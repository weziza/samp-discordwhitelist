#define DCMD_PREFIX '!' //Prefix discord bot kamu
//#define DCMD_STRICT_CASE // mendefinisikan ini akan mengaktifkan case sensitif, !TEST dan !test akan mengeluarkan hasil yang berbeda
//#define DCMD_ALLOW_BOTS // mendefinisikan ini akan mengabaikan perintah yang dijalankan oleh bot
#include <discord-connector>
#include <discord-cmd> 
#include <a_samp>
#include <dini>
#include <Pawn.CMD>

#define DIALOG_KICK      1

static DCC_Channel:commandChannel; // kalian bisa menggunakan non-static
main() 
{
 	commandChannel = DCC_FindChannelById("CHANNEL ID KALIAN"); 
    DCC_SetBotPresenceStatus(DCC_BotPresenceStatus:IDLE); // Bot Status. Idle,Online,Invisible,Busy
    DCC_SetBotActivity("brrr"); // Bot status "PLAYING"
}
public OnFilterScriptInit()
{
        print("Hey seiso here!");
        return 1;
}
public OnFilterScriptExit()
{
        print("brrr");
        return 1;
}
public OnPlayerConnect(playerid)
{
    new playername[MAX_PLAYER_NAME+1];
    GetPlayerName(playerid, playername, sizeof(playername));
    new player[200];
    format(player,sizeof(player),"/testwhitelist/%s.txt",playername);
    if(!dini_Exists(player))
    {
        ShowPlayerDialog(playerid,DIALOG_KICK,DIALOG_STYLE_MSGBOX,"{00FFFF}WHITELIST DINI","Kamu belum terdaftar whitelist","Okay","");
        SetTimerEx("KickTimer",3000,0,"i",playerid);
    }
    else
    {
    }
    return 1;
}
DCMD:whitelist(user, channel, params[]) {

    if(channel != commandChannel) // Menggunakan specific channel, kamu bisa mengantinya dengan user atau role. Jika tereksekusi selain di //commandchannel tidak akan terjadi apa2
        return 1;

	new String[256], str[356];
	if(isnull(params)) return DCC_SendChannelMessage(channel, "USAGE: !whitelist [Player_Name]");
	format(String,sizeof(String),"testwhitelist/%s.txt", params);
	dini_Create(String);
	format(str,sizeof(str),"SERVER : Nama %s telah terdaftar kedalam whitelist", params);
	DCC_SendChannelMessage(channel, str);
	return 1;
}
forward KickTimer(playerid);
public KickTimer(playerid)
{
	Kick(playerid);
	return 1;
}
