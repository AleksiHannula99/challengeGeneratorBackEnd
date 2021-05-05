<?php
require_once 'inc/headers.php';
require_once 'inc/functions.php';

$ID = filter_input(INPUT_POST, 'ID',FILTER_SANITIZE_NUMBER_INT);
$ruleOrCharacter = filter_input(INPUT_POST, 'ruleOrCharacter',FILTER_SANITIZE_NUMBER_INT);


try{
    if ($ruleOrCharacter == 0) {
        $db = openDb();
        $query = $db->prepare("DELETE FROM person WHERE ch_id = :chID;");

        $query->bindValue(':chID',$ID,PDO::PARAM_INT);
        $query->execute();
    } else {
        $db = openDb();
        $query = $db->prepare("DELETE FROM extra WHERE extra_id = :ruleID;");

        $query->bindValue(':ruleID',$ID,PDO::PARAM_INT);
        $query->execute();
    }

} catch(PDOException $pdoex) {
    returnError($pdoex);
}