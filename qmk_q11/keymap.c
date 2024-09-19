#include QMK_KEYBOARD_H

enum layers {
    MAC_BASE,
    MAC_FN_1,
    WIN_BASE,
    WIN_FN,
    MAC_FN_2,
};

#define KC_TASK LGUI(KC_TAB)
#define KC_FLXP LGUI(KC_E)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
    [MAC_BASE] = LAYOUT_91_ansi(
        KC_MPLY,        KC_ESC,             KC_BRID,      KC_BRIU,  KC_MCTL,  KC_LPAD,  RGB_VAD,   RGB_VAI,  KC_MPRV,  KC_MPLY,  KC_MNXT,  KC_MUTE,  KC_VOLD,    KC_VOLU,  KC_INS,   KC_DEL,   KC_MUTE,
        MO(MAC_FN_1),   KC_GRV,             KC_1,         KC_2,     KC_3,     KC_4,     KC_5,      KC_6,     KC_7,     KC_8,     KC_9,     KC_0,     KC_MINS,    KC_EQL,   KC_BSPC,            KC_PGUP,
        MO(MAC_FN_2),   KC_TAB,             KC_Q,         KC_W,     KC_E,     KC_R,     KC_T,      KC_Y,     KC_U,     KC_I,     KC_O,     KC_P,     KC_LBRC,    KC_RBRC,  KC_BSLS,            KC_PGDN,
        MO(WIN_BASE),   MT(MOD_LCTL,KC_ESC),KC_A,         KC_S,     KC_D,     MT(MOD_LSFT, KC_F),  KC_G,     KC_H,     MT(MOD_RSFT, KC_J), KC_K,     KC_L,       KC_SCLN,  KC_QUOT,              KC_ENT,             KC_HOME,
        MO(WIN_FN),     KC_LSFT,                          KC_Z,     KC_X,     KC_C,     KC_V,      KC_B,     KC_N,     KC_M,     KC_COMM,  KC_DOT,   KC_SLSH,              KC_RSFT,  KC_UP,
        DB_TOGG,        KC_LCTL,  MO(MAC_FN_1), KC_LCMD,  KC_LOPT,            LT(MAC_FN_2, KC_SPC),          LT(MAC_FN_1, KC_BSPC),        KC_RCMD,  KC_ROPT,    KC_RCTL,  KC_LEFT,  KC_DOWN,  KC_RGHT),

    [MAC_FN_1] = LAYOUT_91_ansi(
        RGB_TOG,  _______,  KC_F1,       KC_F2,    KC_F3,          KC_F4,    KC_F5,     KC_F6,       KC_F7,         KC_F8,      KC_F9,        KC_F10,   KC_F11,     KC_F12,   _______,  _______,  RGB_TOG,
        _______,  _______,  _______,     _______,  _______,        _______,  _______,   _______,     _______,       _______,    _______,      _______,  _______,    _______,  _______,            _______,
        _______,  _______,  KC_MS_BTN4,  _______,  KC_MS_BTN5,     _______,  _______,   _______,     KC_MS_WH_UP,   _______,    _______,      _______,  _______,    _______,  _______,            _______,
        _______,  _______,  _______,     _______,  KC_MS_WH_DOWN,  _______,  _______,   KC_MS_LEFT,  KC_MS_DOWN,    KC_MS_UP,   KC_MS_RIGHT,  _______,  _______,              _______,            _______,
        _______,  _______,               _______,  _______,        _______,  _______,   _______,     KC_MS_BTN1,    KC_MS_BTN3, KC_MS_BTN2,   _______,  _______,              _______,  _______,
        _______,  _______,  _______,     _______,  _______,                  KC_ENT,                                _______,    _______,      _______,  _______,    _______,  _______,  _______),

    [WIN_BASE] = LAYOUT_91_ansi(
        KC_MUTE,  KC_ESC,       KC_F1,      KC_F2,    KC_F3,    KC_F4,    KC_F5,     KC_F6,    KC_F7,    KC_F8,    KC_F9,    KC_F10,   KC_F11,     KC_F12,   KC_INS,   KC_DEL,   KC_MUTE,
        _______,  KC_GRV,       KC_1,       KC_2,     KC_3,     KC_4,     KC_5,      KC_6,     KC_7,     KC_8,     KC_9,     KC_0,     KC_MINS,    KC_EQL,   KC_BSPC,            KC_PGUP,
        _______,  KC_TAB,       KC_Q,       KC_W,     KC_E,     KC_R,     KC_T,      KC_Y,     KC_U,     KC_I,     KC_O,     KC_P,     KC_LBRC,    KC_RBRC,  KC_BSLS,            KC_PGDN,
        _______,  MT(MOD_LCTL,  KC_ESC),    KC_A,     KC_S,     KC_D,     KC_F,      KC_G,     KC_H,     KC_J,     KC_K,     KC_L,     KC_SCLN,  KC_QUOT,              KC_ENT,             KC_HOME,
        _______,  KC_LSFT,                            KC_Z,     KC_X,     KC_C,      KC_V,     KC_B,     KC_N,     KC_M,     KC_COMM,  KC_DOT,   KC_SLSH,              KC_RSFT,  KC_UP,
        _______,  KC_LCTL,  MO(WIN_FN), KC_LWIN,  KC_LALT,            KC_SPC,                        KC_SPC,             KC_RALT,  MO(WIN_FN), KC_RCTL,  KC_LEFT,  KC_DOWN,  KC_RGHT),

    [WIN_FN] = LAYOUT_91_ansi(
        RGB_TOG,  _______,  KC_BRID,  KC_BRIU,  KC_TASK,  KC_FLXP,  RGB_VAD,   RGB_VAI,  KC_MPRV,  KC_MPLY,  KC_MNXT,  KC_MUTE,  KC_VOLD,    KC_VOLU,  _______,  _______,  RGB_TOG,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,   _______,  _______,  _______,  _______,  _______,  _______,    _______,  _______,            _______,
        _______,  RGB_TOG,  RGB_MOD,  RGB_VAI,  RGB_HUI,  RGB_SAI,  RGB_SPI,   _______,  _______,  _______,  _______,  _______,  _______,    _______,  _______,            _______,
        _______,  _______,  RGB_RMOD, RGB_VAD,  RGB_HUD,  RGB_SAD,  RGB_SPD,   _______,  _______,  _______,  _______,  _______,  _______,              _______,            _______,
        _______,  _______,            _______,  _______,  _______,  _______,   _______,  NK_TOGG,  _______,  _______,  _______,  _______,              _______,  _______,
        _______,  _______,  _______,  _______,  _______,            _______,                       _______,            _______,  _______,    _______,  _______,  _______,  _______),

    [MAC_FN_2] = LAYOUT_91_ansi(
        RGB_TOG,  _______,  KC_F1,    KC_F2,    KC_F3,    KC_F4,    KC_F5,     KC_F6,    KC_F7,    KC_F8,    KC_F9,     KC_F10,   KC_F11,     KC_F12,   _______,  _______,  RGB_TOG,
        _______,  _______,  _______,  _______,  _______,  _______,  _______,   _______,  _______,  _______,  _______,   _______,  _______,    _______,  _______,            _______,
        _______,  RGB_TOG,  RGB_MOD,  RGB_VAI,  RGB_HUI,  RGB_SAI,  RGB_SPI,   _______,  _______,  _______,  _______,   _______,  _______,    _______,  _______,            _______,
        _______,  _______,  RGB_RMOD, RGB_VAD,  RGB_HUD,  RGB_SAD,  RGB_SPD,   KC_LEFT,  KC_DOWN,  KC_UP,    KC_RIGHT,  _______,  _______,              _______,            _______,
        _______,  _______,            _______,  _______,  _______,  _______,   _______,  NK_TOGG,  _______,  _______,   _______,  _______,              _______,  _______,
        _______,  _______,  _______,  _______,  _______,            _______,                       _______,             _______,  _______,    _______,  _______,  _______,  _______),

};

// Set RGB colors for each layer
void set_layer_color(int layer) {
    printf("Layer: %d\n", layer);
    switch (layer) {
        case MAC_BASE:
            rgblight_sethsv(0xFF, 0xFF, 0xFF); // Red for base layer
            break;
        case MAC_FN_1:
            rgblight_sethsv(0x55, 0xFF, 0xFF); // Green for layer 1
            break;
        case MAC_FN_2:
            rgblight_sethsv(0xAC, 0xFF, 0xFF); // Blue for layer 2
            break;
        default:
            rgblight_sethsv(0xFF, 0xFF, 0xFF); // White for any other layer
            break;
    }
}

layer_state_t layer_state_set_user(layer_state_t state) {
    set_layer_color(biton32(state));
    return state;
}

#if defined(ENCODER_MAP_ENABLE)
const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][NUM_DIRECTIONS] = {
    [MAC_BASE] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_VOLD, KC_VOLU) },
    [MAC_FN_1] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_VOLD, KC_VOLU) },
    [MAC_FN_2] = { ENCODER_CCW_CW(RGB_VAD, RGB_VAI), ENCODER_CCW_CW(RGB_VAD, RGB_VAI) },
    [WIN_BASE] = { ENCODER_CCW_CW(KC_VOLD, KC_VOLU), ENCODER_CCW_CW(KC_VOLD, KC_VOLU) },
    [WIN_FN]   = { ENCODER_CCW_CW(RGB_VAD, RGB_VAI), ENCODER_CCW_CW(RGB_VAD, RGB_VAI) }
};
#endif // ENCODER_MAP_ENABLE
