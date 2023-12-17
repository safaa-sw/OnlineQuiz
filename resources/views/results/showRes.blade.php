@extends('layouts.app')

@section('content')
    <h3 class="page-title">@lang('quickadmin.results.title')</h3>

    <div class="panel panel-default">
        <div class="panel-heading">
            @lang('quickadmin.view-result')
        </div>

        <div class="panel-body">
            <div class="row">
                <div class="col-md-3">
                    <table class="table table-bordered table-striped">
                        <tr><th>Your Mark</th><td>{{$test->mark}}</td></tr>
                        <tr><th>Your Result</th><td>{{$test->result}}</td></tr>
                    </table>
                    
                </div>
            </div>
            <p>&nbsp;</p>

        </div>
    </div>
@stop
