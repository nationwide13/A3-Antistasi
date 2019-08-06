params["_vehicle", "_caller", "_actionID"];

if(!isPlayer _caller) exitWith {hint "Only players are currently able to breach vehicles!";};

//Only engineers should be able to breach a vehicle
_isEngineer = _caller getUnitTrait "engineer";
if(!_isEngineer) exitWith {hint "You have to be an engineer to breach open a vehicle!";};

if(!alive _vehicle) exitWith {hint "Why would you want to breach open a destroyed vehicle?"; _vehicle removeAction _actionID;};

_isAPC = (typeOf _vehicle) in vehAPCs;
_isTank = (typeOf _vehicle) in vehTanks;

if(_isAPC && !("DemoCharge_Remote_Mag" in (magazines _caller))) exitWith {hint "You need a explosive charge to breach an APCs open!"};
if(_isTank && !("SatchelCharge_Remote_Mag" in (magazines _caller))) exitWith {hint "You need a explosive satchel to breach a tank open!"};

_time = 15 + (random 5);
if(_isAPC) then
{
  _time = 25 + (random 10);
};
if(_isTank) then
{
  _time = 45 + (random 15);
};

_caller setVariable ["timeToBreach",time + _time];
_caller playMoveNow selectRandom medicAnims;
_caller setVariable ["breachVeh", _vehicle];
_caller setVariable ["animsDone",false];
_caller setVariable ["cancelBreach",false];

_action = _caller addAction ["Cancel Breaching", {(_this select 1) setVariable ["cancelBreach",true]},nil,6,true,true,"","(isPlayer _this) && (_this == vehicle _this)"];
_vehicle removeAction _actionID;

_caller addEventHandler ["AnimDone",
{
	private _caller = _this select 0;
  private _vehicle = _caller getVariable "breachVeh";
	if
  (
    (alive _vehicle) &&
    {(_caller == vehicle _caller) &&
    {(_caller distance _vehicle < 8) &&
    {([_caller] call A3A_fnc_canFight) &&
    {(time <= (_caller getVariable ["timeToBreach",time])) &&
    {!(_caller getVariable ["cancelBreach",false])}}}}}
  ) then
	{
		_caller playMoveNow selectRandom medicAnims;
	}
	else
	{
		_caller removeEventHandler ["AnimDone",_thisEventHandler];
		_caller setVariable ["animsDone",true];
	};
}];

//Wait for anims to finish
waitUntil {sleep 0.5; (_caller getVariable ["animsDone",false])};

_caller setVariable ["breachVeh", objNull];
_caller removeAction _action;

if
(
  !alive _vehicle ||
  {_caller != vehicle _caller || //TODO there was something about that on the optimisation page, look it up
  {_caller distance _vehicle >= 8 ||
  {!([_caller] call A3A_fnc_canFight) ||
  {_caller getVariable ["cancelBreach",false]}}}}
) exitWith
{
	hint "Breaching cancelled";
  _caller setVariable ["cancelBreach",nil];
  if(alive _vehicle) then {_vehicle addAction ["Breach Vehicle", {[_this select 0, _this select 1, _this select 2] execVM "breachVehicle.sqf"},nil,4,false,true,"","(isPlayer _this)",5];};
};

_damageDealt = 0;
if(_isAPC) then
{
  _caller removeMagazine "DemoCharge_Remote_Mag";
  _damageDealt = 0.15 + random 0.15;
};

if(_isTank) then
{
  _caller removeMagazine "SatchelCharge_Remote_Mag";
  _damageDealt = 0.25 + random 0.25;
};

_currentDamage = _vehicle getHit (getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints" >> "HitHull" >> "name"));
_result = _currentDamage + _damageDealt;
if(_result > 1) then {_result = 1};
_vehicle setHit [getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints" >> "HitHull" >> "name"), _result];

_currentDamage = _vehicle getHitPointDamage (getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitFuel" >> "HitHull" >> "name"));
_result = _currentDamage + _damageDealt;
if(_result > 1) then {_result = 1};
_vehicle setHit [getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints" >> "HitFuel" >> "name"), _result];

_currentDamage = _vehicle getHitPointDamage (getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitEngine" >> "HitHull" >> "name"));
_result = _currentDamage + _damageDealt;
if(_result > 1) then {_result = 1};
_vehicle setHit [getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints" >> "HitEngine" >> "name"), _result];

_currentDamage = _vehicle getHitPointDamage (getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints" >> "HitBody" >> "name"));
_result = _currentDamage + _damageDealt;
if(_result > 1) then {_result = 1};
_vehicle setHit [getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "HitPoints" >> "HitBody" >> "name"), _result];

if(((damage _vehicle) + _damageDealt) > 0.9) exitWith
{
  _bomb = "SatchelCharge_Remote_Ammo_Scripted" createVehicle (getPos _vehicle);
  _bomb setDamage 1;
  _vehicle setDamage 1;
};

playSound3D [ "A3\Sounds_F\environment\ambient\battlefield\battlefield_explosions3.wss", _vehicle, false, (getPos _vehicle), 4, 1, 0 ];

sleep 0.5;
_vehicle lock 0;

_crew = crew _vehicle;
{
    if(random 10 > 7) then
    {
      _x setDamage 1;
    };
    if(alive _X) then
    {
      moveOut _x;
      _x setVariable ["surrendered",true,true];
      [_x] spawn A3A_fnc_surrenderAction;
    }
    else
    {
      _dropPos = _vehicle getRelPos [5, random 360];
      _X setPos _dropPos;
    };
} forEach _crew;

if((_isAPC && {(typeOf _vehicle) in vehNATOAPC}) || {_isTank && {(typeOf _vehicle) in vehNATOTank}}) then
{
  [1,0] remoteExec ["A3A_fnc_prestige",2];
  if(citiesX findIf {(getMarkerPos _x) distance _vehicle < 300} != -1) then
  {
    [-1, 1, getPos _vehicle] remoteExec ["A3A_fnc_citySupportChange",2];
  };
}
else
{
  [0,1] remoteExec ["A3A_fnc_prestige",2];
};
