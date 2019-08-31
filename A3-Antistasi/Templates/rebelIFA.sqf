rebelMortar = "LIB_M2_60";
rebelMortarRoundHE = "LIB_8Rnd_60mmHE_M2";
rebelMortarRoundSmoke = "not_supported";
rebelStaticMG = "LIB_M1919_M2";
rebelStaticAT = "LIB_Pak40";
rebelStaticAA = "LIB_FlaK_30";

rebelStaticCrew = "LIB_US_Bomber_Crew";
rebelUnarmed = "I_G_Survivor_F";
rebelSniper = ["LIB_WP_Sniper","LIB_WP_Sniper"];
rebelAT = ["LIB_WP_AT_grenadier","LIB_WP_AT_grenadier"];
rebelMedic = ["LIB_WP_Medic","LIB_WP_Medic"];
rebelHeavyGunner = ["LIB_WP_Mgunner","LIB_WP_Mgunner"];
rebelExpSpec = ["LIB_WP_Saper","LIB_WP_Saper"];
rebelGrenadier = ["LIB_WP_Radioman","LIB_WP_Radioman"];
rebelLiteAT = ["LIB_WP_Strzelec","LIB_WP_Strzelec"];
rebelSquadLeader = ["LIB_WP_Porucznic","LIB_WP_Porucznic"];
rebelEngineer = ["LIB_WP_Starszy_saper","LIB_WP_Starszy_saper"];

rebelVehQuadbike = "LIB_DAK_Kfz1";
rebelVehLiteArmed = "LIB_DAK_Kfz1_MG42";
rebelVehLiteAT = "not_supported";
rebelVehLiteUnarmed = "LIB_US_Willys_MB";
rebelVehTransport = "LIB_US_GMC_Open";
//rebelVehHeli = "I_C_Heli_Light_01_civil_F";
rebelVehPlane = "LIB_US_NAC_P39";
rebelVehBoat = "I_C_Boat_Transport_01_F";
rebelVehRepair = "LIB_US_GMC_Parm";
rebelFlag = "Flag_Syndikat_F";
rebelFlagTexture = "ak.jpg"; if (isServer) then {flagX setFlagTexture rebelFlagTexture};
typePetros = "LIB_WP_Sierzant";

rebelStaticSupportMG = "not_supported";
rebelStaticSupportAT = "not_supported";
rebelStaticTallMG = "not_supported";
rebelStaticSupportTallMG = "not_supported";
rebelStaticSupportAA = "not_supported";
rebelStaticMortarBag = "not_supported";
rebelStaticSupportMortar = "not_supported";

civCar = "LIB_GazM1_dirty";
civTruck = "LIB_DAK_OpelBlitz_Open";
civHeli = "not_supported";
civBoat = "C_Boat_Transport_02_F";

sniperRifle = "LIB_K98ZF39";
rebelStartingFlashlight = ["not_supported"];

rebelMineAT = "LIB_TM44_MINE_mag";
rebelMineAP = "LIB_PMD6_MINE_mag";

if (gameMode != 4) then
	{
	militiaRifleman = "LIB_DAK_Soldier";
	militiaMarksman = "LIB_DAK_Sniper";
	militiaVehArmed = "LIB_Kfz1_MG42_camo";
	militiaVehTransport = "LIB_OpelBlitz_Open_Y_Camo_w";
	militiaVehUnarmed = "LIB_Kfz1_hood_w";
	militiaGroupLow = [["LIB_DAK_Soldier_2","LIB_DAK_Soldier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier"],[militiaMarksman,militiaRifleman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	militiaGroupMid = [["LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier_2","LIB_DAK_Soldier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_AT_soldier","LIB_DAK_AT_grenadier"],["LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier","LIB_DAK_Sniper"]];
	militiaGroupLarge = ["LIB_DAK_NCO_2","LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier_3","LIB_DAK_AT_grenadier","LIB_DAK_AT_soldier","LIB_DAK_radioman","LIB_DAK_medic"];//"IRG_InfSquad";///
	militiaGroupBest = [militiaGroupLarge,["LIB_DAK_NCO_2","LIB_DAK_Soldier_2","LIB_DAK_Soldier_3","LIB_DAK_Soldier_3","LIB_DAK_AT_grenadier","LIB_DAK_Sniper","LIB_DAK_radioman","LIB_DAK_medic"]];
	militiaFactionName = "LIB_DAK";
	}
else
	{
	militiaRifleman = "LIB_NKVD_rifleman";
	militiaMarksman = "LIB_NKVD_LC_rifleman";
	militiaVehArmed = "LIB_Scout_m3_w";
	militiaVehTransport = "LIB_Zis5v_w";
	militiaVehUnarmed = "LIB_Willys_MB_w";
	militiaGroupLow = [[militiaRifleman,militiaRifleman],[militiaMarksman,militiaRifleman]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
	militiaGroupMid = [["LIB_NKVD_p_officer","LIB_NKVD_smgunner","LIB_NKVD_LC_rifleman","LIB_NKVD_rifleman"]];
	militiaGroupLarge = ["LIB_NKVD_lieutenant","LIB_NKVD_smgunner","LIB_NKVD_smgunner","LIB_NKVD_p_officer","LIB_NKVD_p_officer","LIB_NKVD_LC_rifleman","LIB_NKVD_rifleman","LIB_SOV_medic"];//"IRG_InfSquad";///
	militiaGroupBest = [militiaGroupLarge];
	militiaFactionName = "LIB_NKVD";
	};

vehPoliceCar = "LIB_Kfz1_sernyt";
policeOfficer = "SG_sturmpanzer_unterofficer";
policeGrunt = "SG_sturmpanzer_crew";
groupsNATOGen = [policeOfficer,policeGrunt];
rebelFactionName = "AK";

factionGEN = "SG_STURMPANZER";

//Player spawn loadout
rebelDefaultLoadout = [[],[],[],["U_LIB_WP_Soldier_camo_3", []],[],[],"","",[],["ItemMap","","","","",""]];

//Arsenal and Initial AI weapon setup
unlockedWeapons = ["LIB_PTRD","LIB_M2_Flamethrower","LIB_Binocular_GER","LIB_K98","LIB_M1895","LIB_FLARE_PISTOL"];//"LMG_03_F"
unlockedRifles = ["LIB_K98"];//standard rifles for AI riflemen, medics engineers etc. are picked from this array. Add only rifles.
unlockedMagazines = ["LIB_1Rnd_145x114","LIB_M2_Flamethrower_Mag","LIB_5Rnd_792x57","LIB_Pwm","LIB_Rg42","LIB_US_TNT_4pound_mag","LIB_7Rnd_762x38","LIB_1Rnd_flare_red","LIB_1Rnd_flare_green","LIB_1Rnd_flare_white","LIB_1Rnd_flare_yellow"];
initialRifles = ["LIB_K98"];
unlockedAT = [];
unlockedBackpacks = ["B_LIB_US_M2Flamethrower","B_LIB_SOV_RA_MGAmmoBag_Empty"];
//TFAR Unlocks
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["B_LIB_US_Radio"]};