<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image">
                <a href="{{ url('/member/profile/changeprofile') }}">
                @if (Auth::user()->avantar == '')
                {!! HTML::image('img/avatar.png', 'User Image', array('class' => 'img-circle')) !!}
                @else
                {!! HTML::image('uploads/images/avantar/'.Auth::user()->avantar, 'User Image', array('class' => 'img-circle')) !!}
                @endif
                </a>
            </div>
            <div class="pull-left info">
                <p>{{ Auth::user()->name }}</p>
                <!-- Status -->
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li><a href="{{ url('device') }}"><i class='fa fa-user'></i> <span>Quản lý thiết bị</span></a></li>
            <li><a href="{{ url('control/index') }}"><i class='fa fa-user'></i> <span>Điều khiển và lập lịch</span></a></li>
            <li><a href="{{ url('irrigation') }}"><i class='fa fa-user'></i> <span>Thiết lập tưới</span></a></li>
            <li><a href="{{ url('profile/changeprofile') }}"><i class='fa fa-user'></i> <span>Profile</span></a></li>
            <li><a href="{{ url('/auth/logout') }}"><i class='fa fa-sign-out'></i> <span>Logout</span></a></li>
            
            <li class="header">SYSTEM</li>
            @if (Auth::user()->can('user-manager'))
            <li><a href="{{ url('user') }}"><i class='fa fa-gear'></i> <span>Quản lý người dùng</span></a></li>
            @endif
            @if (Auth::user()->can('role-manager'))
            <li><a href="{{ url('role') }}"><i class='fa fa-user'></i> <span>Quản lý phân quyền</span></a></li>
            @endif
            @if (Auth::user()->can('devicetype-manager'))
            <li><a href="{{ url('devicetype') }}"><i class='fa fa-user'></i> <span>Quản lý loại thiết bị</span></a></li>
            @endif
            @if (Auth::user()->can('config-manager'))
            <li><a href="{{ url('config') }}"><i class='fa fa-gear'></i> <span>Cấu hình hệ thống</span></a></li>
            @endif
            @if (Auth::user()->can('log-manager'))
            <li><a href="{{ url('log') }}"><i class='fa fa-gear'></i> <span>Log</span></a></li>
            @endif

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
