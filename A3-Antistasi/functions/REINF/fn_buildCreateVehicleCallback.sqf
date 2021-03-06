params ["_structureType", "_posASL", "_dir"];

private _positionX = ASLtoATL _posASL;

private _isPlayer = if (player == build_engineerSelected) then {true} else {false};
private _timeOut = time + 30;

if (!_isPlayer) then
{
	build_engineerSelected doMove _positionX
}
else
{
	build_time = build_time / 2;
	["Build Info", "Walk to the selected position to start building"] call A3A_fnc_customHint;
};

build_targetLocation = _positionX;
build_atBuildLocation = false;
build_cancelBuild = false;

addMissionEventHandler ["Draw3D", {
	if (build_atBuildLocation || build_cancelBuild) exitWith {
		removeMissionEventHandler ["Draw3D", _thisEventHandler];
	};
	drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa", [1,1,1,1], build_targetLocation, 1,1,0,"Build", 0, 0.05, "PuristaMedium"];
}];

waitUntil {sleep 1;(time > _timeOut) or (build_engineerSelected distance _positionX < 3)};

if (time > _timeOut) exitWith 
{
	build_cancelBuild = true;
	["Build Info", "You didn't move to the position, construction has timed out."] call A3A_fnc_customHint;
};

build_atBuildLocation = true;
build_targetLocation = nil;


if (build_cost > 0) then
	{
	_nul = [0, - build_cost] remoteExec ["A3A_fnc_resourcesFIA",2];
	[-0.06 * build_cost , Occupants] remoteExec ["A3A_fnc_timingCA",2];
	_chance = round(random 100);
	if (_chance <= buildingAttackChance) then {
		buildingAttackChance = 0;
		[[],"A3A_fnc_attackHQ"] remoteExec ["A3A_fnc_scheduler",2];
	} else {
		buildingAttackChance = buildingAttackChance + (build_cost / 1000);
	}
	};

build_engineerSelected setVariable ["constructing",true];

_timeOut = time + build_time;

if (!_isPlayer) then
	{
	{build_engineerSelected disableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"];
	};

build_engineerSelected playMoveNow selectRandom medicAnims;

build_engineerSelected addEventHandler ["AnimDone",
	{
	private _engineer = _this select 0;
	if (([_engineer] call A3A_fnc_canFight) and !(_engineer getVariable ["helping",false]) and !(_engineer getVariable ["rearming",false]) and (_engineer getVariable ["constructing",false])) then
		{
		_engineer playMoveNow selectRandom medicAnims;
		}
	else
		{
		_engineer removeEventHandler ["AnimDone",_thisEventHandler];
		};
	}];

waitUntil  {sleep 5; !([build_engineerSelected] call A3A_fnc_canFight) or (build_engineerSelected getVariable ["helping",false]) or (build_engineerSelected getVariable ["rearming",false]) or (build_engineerSelected distance _positionX > 4) or (time > _timeOut)};

build_engineerSelected setVariable ["constructing",false];
if (!_isPlayer) then {{build_engineerSelected enableAI _x} forEach ["ANIM","AUTOTARGET","FSM","MOVE","TARGET"]};

if (time <= _timeOut) exitWith {["Build Info", "Construction cancelled"] call A3A_fnc_customHint;};
if (!_isPlayer) then {build_engineerSelected doFollow (leader build_engineerSelected)};

private _veh = [_structureType, _posASL, _dir] call A3A_fnc_placeEmptyVehicle;

if (build_cost > 0) exitWith
{
	staticsToSave pushBackUnique _veh;
	publicVariable "staticsToSave";
};

/*
//falta inicializarlo en veh init
if (build_type == "RB") then
	{
	sleep 30;
	_l1 = "#lightpoint" createVehicle getpos _veh;
	_l1 setLightDayLight true;
	_l1 setLightColor [5, 2.5, 0];
	_l1 setLightBrightness 0.1;
	_l1 setLightAmbient [5, 2.5, 0];
	_l1 lightAttachObject [_veh, [0, 0, 0]];
	_l1 setLightAttenuation [3, 0, 0, 0.6];
	_source01 = "#particlesource" createVehicle getpos _veh;
	_source01 setParticleClass "BigDestructionFire";
	_source02 = "#particlesource" createVehicle getpos _veh;
	_source02 setParticleClass "BigDestructionSmoke";
	[_l1,_source01,_source02,_veh] spawn
		{
		private _veh = _this select 3;
		while {alive _veh} do
			{
			_veh say3D "fire";
			sleep 13;
			};
		{deleteVehicle _x} forEach (_this - [_veh]);
		};
	};
*/
	
while {alive _veh} do
	{
	if ((not([distanceSPWN,1,_veh,teamPlayer] call A3A_fnc_distanceUnits)) and (_veh distance getMarkerPos respawnTeamPlayer > 100)) then
		{
		deleteVehicle _veh
		};
	sleep 60;
	};
	
build_nearestFriendlyMarker = nil;
build_engineerSelected = nil;
