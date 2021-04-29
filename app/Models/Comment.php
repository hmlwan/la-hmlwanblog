<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $fillable= [
        'category_id','title','tags','author','description','markdown','keywords','cover','is_top'
    ];
}
