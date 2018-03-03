<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Config extends Model {

	protected $table = 'config';
	public $timestamps = true;
	/**
	 * The attributes that are mass assignable.
	 *
	 * @var array
	 */
	protected $fillable = ['key', 'code', 'description', 'value', 'type'];

}