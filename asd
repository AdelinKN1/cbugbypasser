   
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
   	   if((IsACBUGWeapon(playerid) && RELEASED(KEY_FIRE)) && newkeys != KEY_FIRE && newkeys & KEY_CROUCH)
	   {
	       ApplyAnimation ( playerid , "PED" , "getup" , 4.1 , 0 , 0 , 0 , 0 , 0 ) ;
	       SCM(playerid,COLOR_WHITE,"{AA3333}Pe serverul nostru este interzis c-bug, risti ban 3 zile.");
	       SetTimer("cbugtimer" ,500 ,false);
	   }
	   return 1;
}

function cbugtimer(playerid) {
	if(GetPlayerAnimationIndex(playerid) != 0)
	{
		KillTimer(cbugtimer);
	}
	else
	{
		new string[128];
		format(string, sizeof(string), "Kick: %s[%d] has been kicked by AdmBot, reason: c-bug bypasser", GetName(playerid), playerid);
		KickEx(playerid);
	}
	return 1;
}
