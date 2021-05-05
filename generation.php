<?php
require_once 'inc/functions.php';
require_once 'inc/headers.php';



try{
    $db=opendb();
    jsonFactory($db,"SELECT generation_id, tainted, ch_name, ch_pic, info, deal, allowed, ending.boss, boss_pic
    FROM generation INNER JOIN person 
    ON generation.ch_id = person.ch_id
    INNER JOIN ending
    ON generation.boss = ending.ending_id
    INNER JOIN deal
    ON generation.ADdeal = deal.deal_id
    INNER JOIN shops
    ON generation.shops = shops.shop_id
    WHERE generation.shops = shop_id AND
    generation.ADdeal = deal_id AND 
    generation.boss = ending_id AND 
    generation.ch_id = person.ch_id
    ORDER BY generation_id DESC
    LIMIT 1");
    //Devil/Angel, Where, shops, character, character pic, boss pic.

} catch (PDOException $pdoex) {
    returnError($pdoex); 
};