<?php
require_once './vendor/autoload.php';
use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount;
class Users {
    protected $database;
    protected $dbname = 'users';
    public function __construct(){
        $acc = ServiceAccount::fromJsonFile(__DIR__ . '/secret/arthursystems-php-tutorials-0066e2bd5954.json');
        $firebase = (new Factory)->withServiceAccount($acc)->create();
        $this->database = $firebase->getDatabase();
    }
    public function get(int $userID = NULL){
        if (empty($userID) || !isset($userID)) { return FALSE; }
        if ($this->database->getReference($this->dbname)->getSnapshot()->hasChild($userID)){
            return $this->database->getReference($this->dbname)->getChild($userID)->getValue();
        } else {
            return FALSE;
        }
    }

    //Insert function
    public function insert(array $data) 
    {
        //Check if table doesnt exist
        if (empty($data) || !isset($data)) 
        {
            return FALSE; 
        }

        //If Table exists

        //If entry exists, update it, otherwise create it 
        foreach ($data as $key => $value){
            $this->database->getReference()->getChild($this->dbname)->getChild($key)->set($value);
        }
        return TRUE;
    }

    //Remove User
    public function delete(int $userID) 
    {
        //Check if userID doesnt exist
        if (empty($userID) || !isset($userID)) 
        {
            return FALSE; 
        }
        
        //If userID exists:
        if ($this->database->getReference($this->dbname)->getSnapshot()->hasChild($userID))
        {
            //Find entry in database and remove
            $this->database->getReference($this->dbname)->getChild($userID)->remove();
            return TRUE;//return true that entry was removed
        } 
        
        //If removal failed, output false 
        else 
        {
            return FALSE;
        }
    }
}

$users = new Users();