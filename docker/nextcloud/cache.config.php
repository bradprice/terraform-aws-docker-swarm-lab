<?php
$CONFIG = array(
  'memcache.local'       => '\\OC\\Memcache\\APCu',
  'memcache.locking'     => '\OC\Memcache\Redis',
  'memcache.distributed' => '\OC\Memcache\Redis',
  'redis' => [
    'host' => 'redis',
    'port' => 6379,
    'timeout' => 1.5,
  ],
  'trusted_proxies'   => [
    'proxy',
  ],
);
