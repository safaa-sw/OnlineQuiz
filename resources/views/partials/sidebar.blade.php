@inject('request', 'Illuminate\Http\Request')
<div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse">
        <ul class="page-sidebar-menu"
            data-keep-expanded="false"
            data-auto-scroll="true"
            data-slide-speed="200">

            @if(Auth::user()->isStudent())
            <li class="{{ $request->segment(1) == 'results' ? 'active' : '' }}">
                <a href="#">
                    <i class="fa fa-gears"></i>
                    <span class="title">My Profile</span>
                </a>
            </li>
            @endif

            @if(Auth::user()->isAdmin())

            <li>
                <a href="#">
                    <i class="fa fa-users"></i>
                    <span class="title">@lang('quickadmin.student-management.title')</span>
                    <span class="fa arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="{{ $request->segment(1) == 'users' ? 'active active-sub' : '' }}">
                        <a href="{{ route('users.index') }}">
                            <i class="fa fa-user"></i>
                            <span class="title">
                                @lang('quickadmin.users.title')
                            </span>
                        </a>
                    </li>
                    <li class="{{ $request->segment(1) == 'results' ? 'active active-sub' : '' }}">
                        <a href="{{ route('results.index') }}">
                            <i class="fa fa-gears"></i>
                            <span class="title">Results</span>
                        </a>
                    </li>
                </ul>
            </li>


            <li class="{{ $request->segment(1) == 'questions' ? 'active' : '' }}">
                <a href="#">
                    <i class="fa fa-gears"></i>
                    <span class="title">@lang('quickadmin.questions.title')</span>
                    <span class="fa arrow"></span>
                </a>
                <ul class="sub-menu">

                    <li class="{{ $request->segment(1) == 'users' ? 'active active-sub' : '' }}">
                        <a href="{{ route('questions.create') }}">
                            <i class="fa fa-plus"></i>
                            <span class="title">
                        @lang('quickadmin.questions.add-new-MC')
                    </span>
                        </a>
                    </li>
       

                    <li class="{{ $request->segment(1) == 'roles' ? 'active active-sub' : '' }}">
                        <a href="{{ route('questions.index') }}">
                            <i class="fa fa-list"></i>
                            <span class="title">
                            @lang('quickadmin.questions.title')
                    </span>
                        </a>
                    </li>
                </ul>
            </li>

            <li class="{{ $request->segment(1) == 'questions_options' ? 'active' : '' }}">
                <a href="{{ route('questions_options.index') }}">
                    <i class="fa fa-gears"></i>
                    <span class="title">@lang('quickadmin.questions-options.title')</span>
                </a>
            </li>


            @endif
            <li>
                <a href="#logout" onclick="$('#logout').submit();">
                    <i class="fa fa-arrow-left"></i>
                    <span class="title">@lang('quickadmin.logout')</span>
                </a>
            </li>
        </ul>


    </div>
</div>
{!! Form::open(['route' => 'auth.logout', 'style' => 'display:none;', 'id' => 'logout']) !!}
<button type="submit">@lang('quickadmin.logout')</button>
{!! Form::close() !!}
