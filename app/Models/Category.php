<?php

namespace App\Models;

use App\Models\Article;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Category extends Model
{
    //

    protected $fillable= [
        'name','desc','sort','keywords','status'
    ];


    public function articles(): HasMany
    {
        return $this->hasMany(Article::class);
    }


}
