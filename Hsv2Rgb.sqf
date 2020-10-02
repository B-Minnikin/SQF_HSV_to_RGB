
fnc_Hsv_2_Rgb = {
    params["_hue", "_saturation", "_value"];

    private _chroma = _value * _saturation;
    private _hPrime = (_hue / 60.0) mod 6;
    private _xValue = _chroma * (1 - abs ((_hPrime mod 2) - 1));
    private _mValue = _value - _chroma;

    private _red = 0;
    private _green = 0;
    private _blue = 0;

    if (0 <= _hPrime && _hPrime < 1) then {
        _red = _chroma;
	_green = _xValue;
    }
    else { if (1 <= _hPrime && _hPrime < 2) then {
    	_red = _xValue;
	_green = _chroma;
    } 
    else { if (2 <= _hPrime && _hPrime < 3) then {
        _green = _chroma;
	_blue = _xValue;
    }
    else { if (3 <= _hPrime && _hPrime < 4) then {
        _green = _xValue;
	_blue = _chroma;
    }
    else { if (4 <= _hPrime && _hPrime < 5) then {
        _red = _xValue;
	_blue = _chroma;
    }
    else { if (5 <= _hPrime && _hPrime < 6) then {
        _red = _chroma;
	_blue = _xValue;
    }}}}}};

    _red = _red + _mValue;
    _green = _green + _mValue;
    _blue = _blue + _mValue;

    private _proceduralTexture = format["#(rgb,8,8,3)color(%1,%2,%3,1)", _red, _green, _blue];
    _proceduralTexture
};
