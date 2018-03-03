<!-- Main Header -->
<header class="main-header">

    <!-- Logo -->
    <a href="{{ url('/home') }}" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>SmartAgri</b> System</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg">SmartAgri System</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Notifications Menu -->

                <li class="dropdown notifications-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                        <i class="fa fa-bell-o"></i>
                        <span class="label label-warning">{{ isset($newnotifications) ? $newnotifications->total() : '' }}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <!-- inner menu: contains the actual data -->
                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 200px;">
                                <ul class="menu" style="overflow: hidden; width: 100%; height: 200px;">
                                    @if (isset($newnotifications) == true)
                                    @foreach($newnotifications as $notification)
                                    <li>
                                        <a href="#" class="notification-link" 
                                           data-title="{{$notification->title }}"
                                           data-content="{{$notification->content }}"
                                           data-type="{{$notification->type }}"
                                           >
                                            <i class="fa fa-users text-aqua"></i> {{$notification->title }}
                                        </a>
                                    </li>
                                    @endforeach
                                    @endif
                                </ul>
                                <div class="slimScrollBar" style="width: 3px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 195.122px; background: rgb(0, 0, 0);"></div><div class="slimScrollRail" style="width: 3px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; background: rgb(51, 51, 51);"></div></div>
                        </li>
                        <li class="footer"><a href="{{ url('notification') }}">View all</a></li>
                    </ul>
                </li>
                <!-- User Account Menu -->
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->

                        @if (Auth::user()->avantar == '')
                        {!! HTML::image('img/avatar.png', 'User Image', array('class' => 'user-image')) !!}
                        @else
                        {!! HTML::image('uploads/images/avantar/'.Auth::user()->avantar, 'User Image', array('class' => 'user-image')) !!}
                        @endif
                        <span>{{Auth::user()->username}}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <!-- The user image in the menu -->
                        <li class="user-header">
                            <a href="{{ url('/profile/changeprofile') }}">
                                @if (Auth::user()->avantar == '')
                                {!! HTML::image('img/avatar.png', 'User Image', array('class' => 'img-circle')) !!}
                                @else
                                {!! HTML::image('uploads/images/avantar/'.Auth::user()->avantar, 'User Image', array('class' => 'img-circle')) !!}
                                @endif
                            </a>
                            <p>
                                {{Auth::user()->username}}
                            </p>
                        </li>
                        <!-- Menu Footer-->
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="{{ url('/user/changepass') }}" class="btn btn-default btn-flat">Đổi mật khẩu</a>

                            </div>
                            <div class="pull-right">
                                <a href="{{ url('/auth/logout') }}" class="btn btn-default btn-flat">Thoát</a>
                            </div>
                        </li>
                    </ul>
                </li>

                <div class="modal fade" id="notificationModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title"></h4>
                            </div>
                            <div class="modal-body">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </ul>
        </div>
    </nav>
</header>