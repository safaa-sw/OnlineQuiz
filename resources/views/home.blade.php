@extends('layouts.app')

@section('content')
    <div class="row">
        <div class="col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">Welcome! </div>

                @if (Auth::user()->isAdmin())
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-6 text-center">
                                <h1>{{ $questions }}</h1>
                                Questions in our database
                            </div>
                            <div class="col-md-6 text-center">
                                <h1>{{ $users }}</h1>
                                Students Registered
                            </div>
                        </div>
                    </div>
                    <div>
                        <img style="padding-left:300px;" src="../images/admin.gif" alt="No GIF">
                    </div>
                @endif


                @if (Auth::user()->isStudent())
                    <div class="row" style="margin: 12px">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                @if (count($studTest) > 0)
                                    <div class="panel-heading">You are finished This Quiz</div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <table class="table table-bordered table-striped">
                                                    <tr>
                                                        <th>Your Mark</th>
                                                        <td>{{ $studTest[0]->mark }}</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Your Result</th>
                                                        <td>{{ $studTest[0]->result }}</td>
                                                    </tr>
                                                </table>

                                            </div>
                                        </div>
                                        <p>&nbsp;</p>
                                    </div>
                                @else
                                    <div class="panel-heading">This Quiz is about PHP</div>
                                    <div class="panel-body">
                                        To start quiz Click Here
                                        <a href="{{ route('tests.index') }}">
                                            <span class="title">
                                                Here
                                            </span>
                                        </a>
                                    </div>
                                @endif


                            </div>
                            <div>
                                <img style="padding-left:300px;" src="../images/student1.gif" alt="No GIF">
                            </div>

                        </div>
                    </div>
            </div>
            @endif


        </div>

    </div>
    </div>
@endsection
