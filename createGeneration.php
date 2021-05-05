<?php
require_once 'inc/functions.php';
require_once 'inc/headers.php';

$noTainteds = filter_input(INPUT_POST, 'tainted',FILTER_SANITIZE_STRING);

$taintedRemove = '';

if($noTainteds === 'true') {
    $taintedRemove = 'WHERE tainted = 0';
}

try{
    $db=opendb();
    jsonFactory($db,"UPDATE generation 
    SET ch_id = (SELECT ch_id FROM person $taintedRemove ORDER BY RAND() LIMIT 1),
    boss = (SELECT ending_id FROM ending ORDER BY RAND() LIMIT 1),
    ADdeal =  (SELECT deal_id FROM deal ORDER BY RAND() LIMIT 1),
    shops =  (SELECT shop_id FROM shops ORDER BY RAND() LIMIT 1)
    WHERE generation_id = 1;");

} catch (PDOException $pdoex) {
    returnError($pdoex); 
};