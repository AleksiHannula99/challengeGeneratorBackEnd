<?php 
require_once 'inc/functions.php';
require_once 'inc/headers.php';

$input = json_decode(file_get_contents('php://input'));

$id = filter_var($input->id,FILTER_SANITIZE_NUMBER_INT);
$name = filter_var($input->name,FILTER_SANITIZE_STRING);
$info = filter_var($input->info,FILTER_SANITIZE_STRING);

try {
    $db = openDb();

    $query = $db->prepare('update person set ch_name =:name, info =:info where ch_id=:id');
    $query->bindValue(':info',$info,PDO::PARAM_STR);
    $query->bindValue(':id',$id,PDO::PARAM_INT);
    $query->bindValue(':name',$name,PDO::PARAM_STR);
    $query->execute();

    header('HTTP/1.1 200 OK');
    $data = array('id' => $id, 'info' => $info, 'name' => $name);
    echo json_encode($data);
}
catch (PDOException $pdoex) {
    returnError($pdoed);
}