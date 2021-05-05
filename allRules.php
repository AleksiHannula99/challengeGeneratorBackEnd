<?php
require_once 'inc/functions.php';
require_once 'inc/headers.php';

try{
    $db=opendb();
    jsonFactory($db,"SELECT * FROM extra");

} catch (PDOException $pdoex) {
    returnError($pdoex); 
};