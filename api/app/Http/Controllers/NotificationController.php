<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use \Illuminate\Support\Facades\Session;
use Auth;

class NotificationController extends Controller {

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index() {
        $notifications = \App\Notification::query()
                ->join('user_notification', 'notification.id', '=', 'user_notification.notification_id')
                ->where('user_notification.user_id', Auth::user()->id)
                ->orderBy('notification.created_at', 'desc')->paginate(10);
        //dd($notifications); 
        return view('notification.index')->with('notifications', $notifications);
    }

    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function changeRead(Request $request) {
        $id = $request['id'];
        $isRead = $request['isRead'];
        $notification = \App\UserNotification::query()
                ->where('user_id', Auth::user()->id)
                ->where('notification_id',$id)->first();
        $notification->update(array('is_read' => true));
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create() {
        $users = \App\User::query()->lists('name', 'id')->toArray();
        return view('notification.create')->with('users', $users);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(Request $request) {
        $this->validate($request, [
            'to' => 'required',
            'title' => 'required',
            'content' => 'required',
        ]);

        $input = $request->all();
        $input['type'] = 3;
        $input['user_id'] = Auth::user()->id;


        $notication = \App\Notification::create($input);
        \App\UserNotification::create(array(
            'notification_id' => $notication->id,
            'user_id' => $input['to'],
        ));

        Session::flash('flash_message', 'Add new notification success!');

        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id) {
        $notification = \App\Notification::find($id);

        return view('notification.show')->with('notification', $notification);
    }


}

?>