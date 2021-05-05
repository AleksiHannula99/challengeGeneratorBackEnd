<?php
require_once 'inc/headers.php';
require_once 'inc/functions.php';


$rule = filter_input(INPUT_POST, 'rule',FILTER_SANITIZE_STRING);

try {
    $db = opendb();

    $query = $db->prepare("REPLACE INTO extra (rule) VALUES (:rule);");
    $query->bindValue(':rule', $rule, PDO::PARAM_STR);
    $query->execute();

} catch (PDOException $pdoex) {
    returnError($pdoex);
}

