<?php
require_once 'inc/headers.php';
require_once 'inc/functions.php';


$chName = filter_input(INPUT_POST, 'chName',FILTER_SANITIZE_STRING);
$chInfo = filter_input(INPUT_POST, 'chInfo',FILTER_SANITIZE_STRING);

try {
    $db = opendb();

    $query = $db->prepare("REPLACE INTO person (ch_name, info, ch_pic) VALUES (:chName, :chInfo, 'default.png');");
    $query->bindValue(':chName', $chName, PDO::PARAM_STR);
    $query->bindValue(':chInfo', $chInfo, PDO::PARAM_STR);
    $query->execute();

} catch (PDOException $pdoex) {
    returnError($pdoex);
}