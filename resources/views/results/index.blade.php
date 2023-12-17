@extends('layouts.app')

@section('content')
    <h3 class="page-title">@lang('quickadmin.results.title')</h3>

    <div class="panel panel-default">
        <div class="panel-heading">
            @lang('quickadmin.list')
        </div>

        <div class="panel-body">
            <table class="table table-bordered table-striped {{ count($results) > 0 ? 'datatable' : '' }}" id="resultTable">
                <thead>
                    <tr>
                        <th>Student</th>
                        <th>Mark</th>
                        <th>Result</th>
                    </tr>
                </thead>
                <tbody>
                    @if (count($results) > 0)
                        @foreach ($results as $result)
                            <tr>
                                <td>{{ $result->user->name }}</td>
                                <td>{{ $result->mark }}</td>
                                <td>{{ $result->result }}</td>
                            </tr>
                        @endforeach
                    @else
                        <tr>
                            <td colspan="6">@lang('quickadmin.no_entries_in_table')</td>
                        </tr>
                    @endif
                </tbody>
            </table>
        </div>
    </div>
@stop
