<?php

Route::get('/demo', ['as' => 'demo', 'uses' => 'SoapController@demo']);

Route::get('/', 'Auth\AuthController@getLogin');

Route::group(['middleware' => 'auth'], function () {

    Route::get('home', 'ControlController@index');
	
	
    Route::get('ajax/realtimeStatus', ['as' => 'ajax.realtimeStatus', 'uses' => 'ControlController@realtimeStatus']);

    Route::get('control/index', ['as' => 'control.index', 'uses' => 'ControlController@index']);
    Route::get('control/history', ['as' => 'control.history', 'uses' => 'ControlController@history']);
    
    Route::get('control/control', ['as' => 'control.control', 'uses' => 'ControlController@precontrol']);
    Route::post('control/control', ['as' => 'control.control', 'uses' => 'ControlController@control']);
    //Add
    Route::get('control/test', ['as' => 'control.test', 'uses' => 'ControlController@test']);
    Route::get('control/receive', ['as' => 'control.receive', 'uses' => 'ControlController@receive']);

    Route::get('member/dashboard', ['as' => 'member.dashboard', 'uses' => 'MemberController@dashboard']);
    Route::get('profile/{action}',['as' => 'member.profile', 'uses' => 'MemberController@profile']);
    Route::post('profile/update',['as' => 'member.update', 'uses' => 'MemberController@update']);
    
    Route::get('device/history', ['as' => 'device.history', 'uses' => 'DeviceController@history']);
    Route::get('device/assign', ['as' => 'device.assign', 'uses' => 'DeviceController@assign']);
    Route::get('device/unassign', ['as' => 'device.unassign', 'uses' => 'DeviceController@unassign']);
    Route::get('device/lost', ['as' => 'device.lost', 'uses' => 'DeviceController@lost']);
    
    Route::post('device/assign', ['as' => 'device.postassign', 'uses' => 'DeviceController@postassign']);
    
    Route::get('device/toggle', ['as' => 'device.toggle', 'uses' => 'DeviceController@toggle']);
    Route::get('schedule/toggle', ['as' => 'schedule.toggle', 'uses' => 'ScheduleController@toggle']);
    Route::any('irrigation/deleteItem',['as' => 'irrigation.deleteItem', 'uses' => 'IrrigationController@delete']);
    Route::get('irrigation/toggle', ['as' => 'irrigation.toggle', 'uses' => 'IrrigationController@toggle']);
    Route::get('device/info', ['as' => 'device.info', 'uses' => 'DeviceController@info']);
    
    Route::get('device/realtime', ['as' => 'device.realtime', 'uses' => 'DeviceController@realtime']);
    Route::get('device/ajaxrealtime', ['as' => 'device.realtime', 'uses' => 'DeviceController@ajaxrealtime']);
    
    Route::get('user/changepass', ['as' => 'user.changepass', 'uses' => 'UserController@prechangepass']);
    Route::post('user/checkpass', ['as' => 'user.checkpass', 'uses' => 'UserController@checkpass']);
    Route::post('user/changepass', ['as' => 'user.changepass', 'uses' => 'UserController@changepass']);
    
    Route::get('deviceSchedule/delete/{id}', ['as' => 'deviceSchedule.delete', 'uses' => 'DeviceScheduleController@destroy']);
    
    Route::resource('user', 'UserController');
    
    Route::resource('config', 'ConfigController');
    Route::resource('log', 'LogController');
    Route::resource('role', 'RoleController');
    Route::resource('device', 'DeviceController');
    Route::resource('deviceSchedule', 'DeviceScheduleController');
    Route::resource('irrigation', 'IrrigationController');
    Route::resource('schedule', 'ScheduleController');
    Route::resource('devicetype', 'DeviceTypeController');
    Route::resource('devicespecification', 'DeviceSpecificationController');
    Route::resource('service', 'ServiceController');
});


// Authentication routes...
Route::get('auth/login', ['as' => 'auth.login', 'uses' => 'Auth\AuthController@getLogin']);
Route::post('auth/login', 'Auth\AuthController@postLogin');
Route::get('auth/logout', 'Auth\AuthController@getLogout');

// Password reset link request routes...
Route::get('password/email', 'Auth\PasswordController@getEmail');
Route::post('password/email', 'Auth\PasswordController@postEmail');

// Password reset routes...
Route::get('password/reset/{token}', 'Auth\PasswordController@getReset');
Route::post('password/reset', 'Auth\PasswordController@postReset');

Route::get('login/facebook', 'Auth\AuthController@redirectToProvider');
Route::get('login/facebook/callback', 'Auth\AuthController@handleProviderCallback');


Route::get('testLogin/{id}', function ($id) {
    Auth::loginUsingId($id);
    return redirect()->route('member.dashboard');
});