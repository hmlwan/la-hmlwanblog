<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    //
    /**
     * @var string[]
     * 允许批量赋值
     */
    protected $fillable = [
        'name',
        'password',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function setPasswordAttribute($password){
        if (!empty($password)) {
            $this->attributes['password'] = bcrypt($password);
        }
    }
}
