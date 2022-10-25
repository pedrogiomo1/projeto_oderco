<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Shipping extends Model
{
    protected $primaryKey = 'id';
    protected $table = "cotacao_frete";
    public $timestamps = false;
    protected $fillable = [
        'uf',
        'percentual_cotacao',
        'valor_extra',
        'transportadora_id'
    ];
}
