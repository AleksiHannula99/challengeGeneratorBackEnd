<?php
require_once '../inc/functions.php';
require_once '../inc/headers.php';

try{
    $db=opendb();
    jsonFactory($db,"SELECT rule FROM extra ORDER BY RAND() LIMIT 1");

} catch (PDOException $pdoex) {
    returnError($pdoex); 
};