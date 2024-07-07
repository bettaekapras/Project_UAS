<?php

namespace App\Models;

use CodeIgniter\Model;

class MMemberToken extends Model
{
    protected $table = 'member_token';
    protected $primaryKey = 'id';
    protected $allowedFields = ['member_id', 'auth_key'];
}