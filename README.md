# -SAMP-Discord-Whitelist
SA-MP DINI with Discord interaction!

## Installing
Download all and put them to your server files

Download this include and put to your `pawno/include`
[discord-cmd] (https://github.com/AkshayMohan/pawn-discord-cmd) 
[samp-discord-connector](https://github.com/maddinat0r/samp-discord-connector) plugin.

## Configuration

```pawn
#define DCMD_PREFIX '~' //If you don't define, by default it is '!'
#define DCMD_STRICT_CASE //Defining this will make commands case-sensitive. !test and !TEST will become different
#define DCMD_ALLOW_BOTS //Defining this will not ignore commands sent on channel by bots.
```

Goto your `server.cfg` then put your discord token there. it will be like this
```
discord_bot_token Njk0NzI3NDMzNzkzODMwOTMz.XoTESTVw.lBeeMTYg2f-8ffXY-ASq1221TESTVSEQ
```

**DONT EVER SHARE YOURE DISCORD BOT TOKEN!**

This code isnt tested yet, So if there a problem please make an issue or pull request so i can fix them. Thanks!
