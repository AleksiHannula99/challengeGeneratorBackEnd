<?php 
require_once 'inc/functions.php';
require_once 'inc/headers.php';

$input = json_decode(file_get_contents('php://input'));

$id = filter_var($input->id,FILTER_SANITIZE_NUMBER_INT);
$rule = filter_var($input->rule,FILTER_SANITIZE_STRING);

try {
    $db = openDb();

    $query = $db->prepare('update extra set rule =:rule where extra_id=:id');
    $query->bindValue(':rule',$rule,PDO::PARAM_STR);
    $query->bindValue(':id',$id,PDO::PARAM_INT);
    $query->execute();

    header('HTTP/1.1 200 OK');
    $data = array('id' => $id, 'rule' => $rule);
    echo json_encode($data);
}
catch (PDOException $pdoex) {
    returnError($pdoed);
}