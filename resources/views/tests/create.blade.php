@extends('layouts.app')

@section('content')
    {!! Form::open(['method' => 'POST', 'route' => ['tests.store']]) !!}

    <div class="panel panel-default">
        <div class="panel-heading">
        <b style="align-items: right;font-family:verdana;font-size:130%;color: #616161;">  @lang('quickadmin.quiz')</b>
        </div>
        <?php //dd($questions) ?>
    @if(count($questions) > 0)
        <div class="panel-body">
        <?php $i = 1; ?>
        @foreach($questions as $question)
            @if ($i > 1) <hr /> @endif
           @if(count($question->options) >0 )
            <div class="row">
                <div class="col-xs-12 form-group">
                    <div class="form-group">
                        <strong><br /><b style="align-items: right;font-family:verdana;font-size:130%;color: #616161;"> Question {{ $i }}.</b>  </strong> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b style="align-items: right;color: red;font-size:100%"> ({!! $question->grade !!}) Points <br /></b>
                        <strong> <br /><b style="align-items: right;font-size:120%"> {!! nl2br($question->question_text) !!}</b><br /> </strong>
                        @if ($question->code_snippet != '')
                            <div class="code_snippet">{!! $question->code_snippet !!}</div>
                        @endif

                        <input
                            type="hidden"
                            name="questions[{{ $i }}]"
                            value="{{ $question->id}}">


                            @foreach($question->options as $option)
                                <br>
                                <label class="radio-inline">
                                    <input
                                            type="radio"
                                            name="answers[{{ $question->id}}]"
                                            value="{{ $option->id }}">
                                            <b style="align-items: right;font-size:100%"> {{ $option->option }}</b>
                                </label><br />
                            @endforeach
                    </div>
                </div>
            </div>

            @else


                    <div class="row">
                        <div class="col-xs-12 form-group">
                            <div class="form-group">
                                <strong>Question {{ $i }}.  </strong> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<b style="align-items: right"> ({!! $question->grade !!}) Points</b>
                                <strong> <br />{!! nl2br($question->question_text) !!} </strong>
                                @if ($question->code_snippet != '')
                                    <div class="code_snippet">{!! $question->code_snippet !!}</div>
                                @endif

                                <input
                                        type="hidden"
                                        name="questions[{{ $i }}]"
                                        value="{{ $question->id}}">


                                <div class="row">
                                    <div class="col-xs-12 form-group">
                                        {!! Form::label('question_text', 'Write your Answer below *', ['class' => 'control-label']) !!}
                                        <textarea name="essay_answers[{{ $question->id}}]" class="form-control" ></textarea>
                                        <p class="help-block"></p>
                                        @if($errors->has('question_text'))
                                            <p class="help-block">
                                                {{ $errors->first('question_text') }}
                                            </p>
                                        @endif

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

            @endif

        <?php $i++; ?>
        @endforeach
        </div>
    @endif
    </div>

    {!! Form::submit(trans('quickadmin.submit_quiz'), ['class' => 'btn btn-danger']) !!}
    {!! Form::close() !!}
@stop

@section('javascript')
    @parent
    <script src="{{ url('quickadmin/js') }}/timepicker.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-timepicker-addon/1.4.5/jquery-ui-timepicker-addon.min.js"></script>
    <script src="https://cdn.datatables.net/select/1.2.0/js/dataTables.select.min.js"></script>
    <script>
        $('.datetime').datetimepicker({
            autoclose: true,
            dateFormat: "{{ config('app.date_format_js') }}",
            timeFormat: "hh:mm:ss"
        });
    </script>

@stop
