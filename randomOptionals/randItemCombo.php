<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

try{
    $db=opendb();
    jsonFactory($db,"SELECT item FROM itemcombo ORDER BY RAND() LIMIT 6");

} catch (PDOException $pdoex) {
    returnError($pdoex); 
};