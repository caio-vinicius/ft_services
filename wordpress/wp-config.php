<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'wordpress' );
define( 'DB_PASSWORD', '1234' );
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         '<=MOS+PtZsr7j@jE1:W1InL~#zF_lbDp!6;`?C*!TCi^4bt=qvUPl?:5G|fmP&x)' );
define( 'SECURE_AUTH_KEY',  '7o6SLmZqMueJK/~`+_1Zp lyXZRGj6}U(RcWc6DORwo!NR:n*Hb[E54*6Hf`fJ:O' );
define( 'LOGGED_IN_KEY',    '11t]1fCc$[S;ch]<~{=*^v?1Ko$i/b&$k@Y@;MR:B8fvO~h <I|{MRJ) fREnn%x' );
define( 'NONCE_KEY',        'F3^B.(1/9(k(I0bAmqqPa8%0$^>z4JA@(vJ|*YZMV,hR1VO${t87ZF@f7dH~QQlF' );
define( 'AUTH_SALT',        'jnjF[0HWVI`*Jg [s1M5&#2mkH<rqcxCxkLd5%Y[SN/=rBC@c$68!t?C/lmX~R-*' );
define( 'SECURE_AUTH_SALT', 'uVL/S]n~;B@Fcfpc`^dm/ _7K~v(}>oRZv5.p_Kj2YIP9D;=b4aQ+:^ZK}w^~,&B' );
define( 'LOGGED_IN_SALT',   'WYd:BT; ,YHT{BWmScg>s)f]Z}HilBx]NOHr:n(Xrk?!=p2N|5bx}1AjZgs7&C7>' );
define( 'NONCE_SALT',       'jQGB6w55JM0,2)K^u;<nA`/#h@i6n7(-l1p/&&$sOyzai}Gp,p?gDnJ&vgyy>2yp' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
