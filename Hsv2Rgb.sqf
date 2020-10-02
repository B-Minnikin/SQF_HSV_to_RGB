
fnc_Hsv_2_Rgb = {
	params["_hue", "_saturation", "_value"];

    private _chroma = _value * _saturation;
    private _hPrime = (_hue / 60.0) mod 6;
    private _x = _chroma * (1 - abs ((_hPrime mod 2) - 1));
    private _m = _value - _chroma;

    private _red = 0;
    private _green = 0;
    private _blue = 0;

    if (0 <= _hPrime && _hPrime < 1) then {
        _red = _chroma;
		_green = _x;
	}
	else { if (1 <= _hPrime && _hPrime < 2) then {
        _red = _x;
		_green = _chroma;
	} 
	else { if (2 <= _hPrime && _hPrime < 3) then {
        _green = _chroma;
		_blue = _x;
	}
	else { if (3 <= _hPrime && _hPrime < 4) then {
        _green = _x;
		_blue = _chroma;
	}
    else { if (4 <= _hPrime && _hPrime < 5) then {
        _red = _x;
		_blue = _chroma;
	}
    else { if (5 <= _hPrime && _hPrime < 6) then {
        _red = _chroma;
		_blue = _x;
	}}}}}};

    _red = _red + _m;
	_green = _green + _m;
	_blue = _blue + _m;

    private _proceduralTexture = format["#(rgb,8,8,3)color(%1,%2,%3,1)", _red, _green, _blue];
	_proceduralTexture
};
