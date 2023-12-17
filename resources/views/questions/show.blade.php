@extends('layouts.app')

@section('content')
    <h3 class="page-title">@lang('quickadmin.questions.title')</h3>
    
    <div class="panel panel-default">
        <div class="panel-heading">
            @lang('quickadmin.view')
        </div>
        
        <div class="panel-body">
            <div class="row">
                <div class="col-md-6">
                    <table class="table table-bordered table-striped">
                    <tr><th>@lang('quickadmin.questions.fields.question-text')</th>
                    <td>{!! $question->question_text !!}</td></tr>
                    <tr><th>Grade</th>
                    <td>{!! $question->grade !!}</td></tr>
                    <tr><th>Options</th>
                        <td>
                            @if ($questionOptions!=null)
                            <table class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>@lang('quickadmin.questions-options.fields.option')</th>
                                        <th>@lang('quickadmin.questions-options.fields.correct')</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($questionOptions as $item)
                                    <tr>
                                        <td>{{ $item->option }}</td>
                                        <td>{{$item->correct == 1 ? 'Yes' : 'No' }}</td>
                                    </tr>
                                
                            @endforeach
                                </tbody>
                            </table>
                            @else
                                There is No Options
                            @endif
                            
                        </td></tr>
                    </table>
                </div>
            </div>

            <p>&nbsp;</p>

            <a href="{{ route('questions.index') }}" class="btn btn-default">@lang('quickadmin.back_to_list')</a>
        </div>
    </div>
@stop