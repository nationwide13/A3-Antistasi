//if (worldName == "Tanoa") exitWith {call compile preProcessFileLineNumbers "Templates\rebel3CBCCMT.sqf"} else {

rebelMortar = "rhsgref_ins_g_2b14";
rebelMortarRoundHE = "rhs_mag_3vo18_10";
rebelMortarRoundSmoke = "rhs_mag_d832du_10";
rebelStaticMG = "UK3CB_TKP_I_NSV";
rebelStaticAT = "UK3CB_UN_I_SPG9";
rebelStaticAA = "UK3CB_UN_I_ZU23";

rebelStaticCrew = "UK3CB_CCM_I_COM";
rebelUnarmed = "UK3CB_CHC_I_SPY";
rebelSniper = ["UK3CB_CCM_I_MK","UK3CB_CCM_I_SNI"];
rebelAT = ["UK3CB_CCM_I_AT","UK3CB_CCM_I_AT"];
rebelMedic = ["UK3CB_CCM_I_MD","UK3CB_CCM_I_MD"];
rebelHeavyGunner = ["UK3CB_CCM_I_AR","UK3CB_CCM_I_AR"];
rebelExpSpec = ["UK3CB_CCM_I_DEM","UK3CB_CCM_I_DEM"];
rebelGrenadier = ["UK3CB_CCM_I_RIF_LITE","UK3CB_CCM_I_RIF_LITE"];
rebelLiteAT = ["UK3CB_CCM_I_RIF_BOLT","UK3CB_CCM_I_RIF_1"];
rebelSquadLeader = ["UK3CB_CCM_I_TL","UK3CB_CCM_I_OFF"];
rebelEngineer = ["UK3CB_CCM_I_ENG","UK3CB_CCM_I_ENG"];

rebelVehQuadbike = "UK3CB_CCM_I_Golf";
rebelVehLiteArmed = "UK3CB_CCM_I_Datsun_Pkm";
rebelVehLiteAT = "UK3CB_CCM_I_Hilux_Spg";
rebelVehLiteUnarmed = "UK3CB_CCM_I_Datsun_Open";
rebelVehTransport = "UK3CB_CCM_I_V3S_Closed";
//rebelVehHeli = "rhsgref_ins_g_Mi8amt";
rebelVehPlane = "UK3CB_CHC_I_Antonov_AN2";
rebelVehBoat = "I_C_Boat_Transport_01_F";
rebelVehRepair = "UK3CB_CCM_I_V3S_Repair";
rebelFlag = "Flag_CCM_B";
rebelFlagTexture = "\UK3CB_Factions\addons\UK3CB_Factions_CCM\Flag\ccm_i_flag_co.paa";
typePetros = "UK3CB_TKP_I_OFF";

rebelStaticSupportMG = "RHS_SPG9_Tripod_Bag";
rebelStaticSupportAT = "RHS_SPG9_Gun_Bag";
rebelStaticTallMG = "RHS_DShkM_Gun_Bag";
rebelStaticSupportTallMG = "RHS_DShkM_TripodHigh_Bag";
rebelStaticSupportAA = "I_AA_01_weapon_F";
rebelStaticMortarBag = "RHS_Podnos_Gun_Bag";
rebelStaticSupportMortar = "RHS_Podnos_Bipod_Bag";

civCar = "UK3CB_CHC_C_Ikarus";
civTruck = "UK3CB_CHC_C_V3S_Recovery";
civHeli = "UK3CB_CHC_C_Mi8AMT";
civBoat = "C_Rubberboat";

arrayCivVeh = ["UK3CB_CHC_C_Datsun_Civ_Closed","UK3CB_CHC_C_Datsun_Civ_Open","UK3CB_CHC_C_Gaz24","UK3CB_CHC_C_Golf","UK3CB_CHC_C_Hatchback","UK3CB_CHC_C_Hilux_Civ_Open","UK3CB_CHC_C_Hilux_Civ_Closed","UK3CB_CHC_C_Ikarus","UK3CB_CHC_C_Kamaz_Covered","UK3CB_CHC_C_Kamaz_Fuel","UK3CB_CHC_C_Kamaz_Open","UK3CB_CHC_C_Kamaz_Repair","UK3CB_CHC_C_Lada","UK3CB_CHC_C_LR_Open","UK3CB_CHC_C_LR_Closed","UK3CB_CHC_C_S1203","UK3CB_CHC_C_S1203_Amb","UK3CB_CHC_C_Sedan","UK3CB_CHC_C_Skoda","UK3CB_CHC_C_Tractor","UK3CB_CHC_C_Tractor_Old","UK3CB_CHC_C_UAZ_Closed","UK3CB_CHC_C_UAZ_Open","UK3CB_CHC_C_Ural","UK3CB_CHC_C_Ural_Open","UK3CB_CHC_C_Ural_Fuel","UK3CB_CHC_C_Ural_Empty","UK3CB_CHC_C_Ural_Repair","UK3CB_CHC_C_V3S_Open","UK3CB_CHC_C_V3S_Closed","UK3CB_CHC_C_V3S_Recovery","UK3CB_CHC_C_V3S_Refuel","UK3CB_CHC_C_V3S_Repair"];

sniperRifle = "UK3CB_BAF_L22";
rebelStartingFlashlight = ["rhs_acc_2dpZenit","acc_flashlight"];

rebelMineAT = "rhs_mine_tm62m_mag";
rebelMineAP = "rhs_mine_pmn2_mag";

if (hasFFAA) then
	{
	call compile preProcessFileLineNumbers "Templates\OccupantsFFAA.sqf"
	}
else
	{
	if (gameMode != 4) then
		{
		militiaRifleman = "UK3CB_BAF_Rifleman_Smock_DPMW";
		militiaMarksman = "UK3CB_BAF_Pointman_Smock_DPMW";
		militiaVehArmed = "UK3CB_BAF_LandRover_WMIK_Milan_FFR_Green_B_Tropical_RM";
		militiaVehTransport = "UK3CB_BAF_MAN_HX60_Cargo_Green_A_Tropical";
		militiaVehUnarmed = "UK3CB_BAF_LandRover_Snatch_FFR_Green_A_Tropical";

		militiaGroupLow = [["UK3CB_BAF_Grenadier_Smock_DPMW","UK3CB_BAF_Rifleman_Smock_DPMW"],["UK3CB_BAF_LAT_Smock_DPMW","UK3CB_BAF_Rifleman_Smock_DPMW"],["UK3CB_BAF_Sniper_Smock_DPMW_Ghillie","UK3CB_BAF_Spotter_Smock_DPMW_Ghillie"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		militiaGroupMid = [["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_Pointman_Smock_DPMW","UK3CB_BAF_MGGPMG_Smock_DPMW","UK3CB_BAF_MGGPMGA_Smock_DPMW"],["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_GunnerM6_Smock_DPMW","UK3CB_BAF_Grenadier_Smock_DPMW","UK3CB_BAF_MAT_Smock_DPMW"],["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_MAT_Smock_DPMW","UK3CB_BAF_MATC_Smock_DPMW","UK3CB_BAF_Engineer_Smock_DPMW"]];
		militiaGroupLarge = ["UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_Rifleman_Smock_DPMW","UK3CB_BAF_LAT_Smock_DPMW","UK3CB_BAF_Medic_Smock_DPMW","UK3CB_BAF_FAC_Smock_DPMW","UK3CB_BAF_MGGPMG_Smock_DPMW","UK3CB_BAF_MGGPMGA_Smock_DPMW","UK3CB_BAF_Marksman_Smock_DPMW"];//"IRG_InfSquad";///
		militiaGroupBest = [militiaGroupLarge];
		militiaFactionName = "UK3CB_TKP_B";
		}
	else
		{
		militiaRifleman = "rhs_vdv_izlom_rifleman_asval";
		militiaMarksman = "rhs_vdv_izlom_marksman_vss";
		militiaVehArmed = "UK3CB_O_G_T34";
		militiaVehTransport = "rhs_gaz66o_vv";
		militiaVehUnarmed = "rhsgref_BRDM2_HQ_vmf";

		militiaGroupLow = [["rhs_vdv_izlom_rifleman_asval","rhs_vdv_izlom_rifleman_LAT"],["rhs_vdv_izlom_marksman","rhs_vdv_izlom_rifleman_LAT"],["rhs_vdv_izlom_rifleman_asval","rhs_vdv_izlom_marksman_vss"]];//["IRG_InfSentry","IRG_ReconSentry","IRG_SniperTeam_M"];///
		militiaGroupMid = [["rhs_vdv_izlom_efreitor","rhs_vdv_izlom_marksman_vss","rhs_vdv_izlom_arifleman","rhs_vdv_izlom_grenadier_rpg"],["rhs_vdv_izlom_efreitor","rhs_vdv_izlom_arifleman","rhs_vdv_izlom_rifleman_asval","rhs_vdv_izlom_marksman"],["rhs_vdv_izlom_efreitor","rhs_vdv_izlom_grenadier_rpg","rhs_vdv_izlom_arifleman","rhs_vdv_izlom_marksman"]];
		militiaGroupLarge = ["rhs_vdv_izlom_sergeant","rhs_vdv_izlom_rifleman_LAT","rhs_vdv_izlom_marksman","rhs_vdv_izlom_rifleman_asval","rhs_vdv_izlom_efreitor","rhs_vdv_izlom_arifleman","rhs_vdv_izlom_rifleman_asval","rhs_vdv_izlom_grenadier_rpg"];//"IRG_InfSquad";///
		militiaGroupBest = [militiaGroupLarge];
		militiaFactionName = "rhs_faction_vv";
		};
	};
//police setup
vehPoliceCar = "UK3CB_TKP_B_Lada_Police";
policeOfficer = "UK3CB_ANP_B_TL";
policeGrunt = "UK3CB_ANP_B_RIF_1";
groupsNATOGen = [policeOfficer,policeGrunt];
rebelFactionName = "CCM";//player faction

factionGEN = "BLU_GEN_F";//police faction

//Player spawn loadout
rebelDefaultLoadout = [[],[],[],["U_BG_Guerilla1_1", []],[],[],"","",[],["ItemMap","","","","",""]];

//Arsenal and Initial AI weapon setup
unlockedWeapons = ["UK3CB_Enfield","rhsusf_weap_m1911a1","Binocular","rhs_weap_panzerfaust60","UK3CB_Enfield_Rail","rhs_weap_Izh18","rhs_weap_pp2000_folded","UK3CB_M79","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];
unlockedRifles = ["UK3CB_Enfield","UK3CB_Enfield_Rail","rhs_weap_Izh18","rhs_weap_m3a1","rhs_weap_m1garand_sa43"];//standard rifles for AI riflemen, medics engineers etc. are picked from this array. Add only rifles.
unlockedMagazines = ["UK3CB_Enfield_Mag","rhsusf_mag_7x45acp_MHP","rhsgref_1Rnd_Slug","rhs_mag_rgd5","rhs_mag_9x19mm_7n31_44","rhs_mag_m576","rhs_mag_m713_red","rhs_mag_m4009","rhsgref_30rnd_1143x23_M1T_SMG","rhsgref_8Rnd_762x63_Tracer_M1T_M1rifle"];
initialRifles = ["UK3CB_Enfield","UK3CB_Enfield_Rail","rhs_weap_Izh18","rhs_weap_savz61"];
unlockedItems = unlockedItems + ["rhs_acc_2dpZenit","rhs_acc_m852v"];
unlockedAT = ["rhs_weap_panzerfaust60"];
unlockedBackpacks = ["UK3CB_ANA_B_B_ASS","UK3CB_TKC_C_B_Sidor_MED","UK3CB_B_Hiker","UK3CB_B_Hiker_Camo"];
//TFAR Unlocks
if (hasTFAR) then {unlockedItems = unlockedItems + ["tf_microdagr","tf_anprc154"]};
if (startLR) then {unlockedBackpacks = unlockedBackpacks + ["tf_anprc155_coyote"]};