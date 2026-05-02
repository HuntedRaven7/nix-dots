{ config, pkgs, ... }:

{
  services.kanata = {
    enable = true;
    # Define your keyboards here (you can name 'internal' whatever you like)
    keyboards.internal = {
      # This is where your kanata lisp config goes
      config = ''
        (defcfg
          process-unmapped-keys yes
        )

        (defsrc
          grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
          caps a    s    d    f    g    h    j    k    l    ;    '    ret
          lsft z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc            ralt rmet rctl
        )

        (deflayer base
          grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
          tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
          @cap @a   @s   @d   @f   g    h    @j   @k   @l   @;   '    ret
          lsft z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc            ralt rmet rctl
        )

        (defalias
          ;; Homerow mods - left hand
          a (tap-hold-release 200 200 a lmet)
          s (tap-hold-release 200 200 s lalt)
          d (tap-hold-release 200 200 d lctl)
          f (tap-hold-release 200 200 f lsft)

          ;; Homerow mods - right hand
          j (tap-hold-release 200 200 j rsft)
          k (tap-hold-release 200 200 k rctl)
          l (tap-hold-release 200 200 l ralt)
          ; (tap-hold-release 200 200 ; rmet)

          ;; Caps lock as Escape on tap, Ctrl on hold
          cap (tap-hold-release 200 200 esc lctl)
        )
      '';
    };
  };
}
