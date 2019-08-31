if (!isServer and hasInterface) exitWith {};

private ["_markerX","_positionX","_isRoad","_radiusX","_road","_veh","_groupX","_unit","_roadcon"];

_markerX = _this select 0;
_positionX = getMarkerPos _markerX;

_isRoad = false;
if (isOnRoad _positionX) then {_isRoad = true};

if (_isRoad) then
	{
	_radiusX = 1;
	_garrison = garrison getVariable _markerX;
	_veh = objNull;

	if (isNil "_garrison") then
		{//this is for backward compatibility, remove after v12
		_garrison = [rebelStaticCrew];
		{
		if (random 20 <= rebelTrainingLevel) then {_garrison pushBack (_x select 1)} else {_garrison pushBack (_x select 0)};
		} forEach rebelGroupAT;
		garrison setVariable [_markerX,_garrison,true];
		};
	while {true} do
		{
		_road = _positionX nearRoads _radiusX;
		if (count _road > 0) exitWith {};
		_radiusX = _radiusX + 5;
		};
	if (rebelStaticCrew in _garrison) then
		{
		_roadcon = roadsConnectedto (_road select 0);
		_dirveh = [_road select 0, _roadcon select 0] call BIS_fnc_DirTo;
		_veh = rebelVehLiteArmed createVehicle getPos (_road select 0);
		_veh setDir _dirveh + 90;
		_veh lock 3;
		_nul = [_veh] call A3A_fnc_AIVEHinit;
		sleep 1;
		};
	_groupX = [_positionX, rebelSide, _garrison,true,false] call A3A_fnc_spawnGroup;
	//_unit = _groupX createUnit [rebelStaticCrew, _positionX, [], 0, "NONE"];
	//_unit moveInGunner _veh;
	{[_x,_markerX] spawn A3A_fnc_rebelCreateBases; if (typeOf _x == rebelStaticCrew) then {_x moveInGunner _veh}} forEach units _groupX;
	}
else
	{
	_formatX = [];
	{
	if (random 20 <= rebelTrainingLevel) then {_formatX pushBack (_x select 1)} else {_formatX pushBack (_x select 0)};
	} forEach rebelGroupSniperTeam;
	_groupX = [_positionX, rebelSide, _formatX] call A3A_fnc_spawnGroup;
	_groupX setBehaviour "STEALTH";
	_groupX setCombatMode "GREEN";
	{[_x,_markerX] spawn A3A_fnc_rebelCreateBases;} forEach units _groupX;
	};

waitUntil {sleep 1; ((spawner getVariable _markerX == 2)) or ({alive _x} count units _groupX == 0) or (not(_markerX in rebelWatchpostsAndRoadblocks))};

if ({alive _x} count units _groupX == 0) then
//if ({alive _x} count units _groupX == 0) then
	{
	rebelWatchpostsAndRoadblocks = rebelWatchpostsAndRoadblocks - [_markerX]; publicVariable "rebelWatchpostsAndRoadblocks";
	markersX = markersX - [_markerX]; publicVariable "markersX";
	sidesX setVariable [_markerX,nil,true];
	_nul = [5,-5,_positionX] remoteExec ["A3A_fnc_citySupportChange",2];
	deleteMarker _markerX;
	if (_isRoad) then
		{
		[["TaskFailed", ["", "Roadblock Lost"]],"BIS_fnc_showNotification"] call BIS_fnc_MP;
		}
	else
		{
		[["TaskFailed", ["", "Watchpost Lost"]],"BIS_fnc_showNotification"] call BIS_fnc_MP;
		};
	};

waitUntil {sleep 1; (spawner getVariable _markerX == 2) or (not(_markerX in rebelWatchpostsAndRoadblocks))};

if (_isRoad) then {if (!isNull _veh) then {deleteVehicle _veh}};
{deleteVehicle _x} forEach units _groupX;
deleteGroup _groupX;