<?php

namespace App\Http\Controllers;


use DB;
use Auth;
use App\Test;
use App\Question;
use App\QuestionsOption;
use Illuminate\Http\Request;
use App\Http\Requests\StoreTestRequest;

class TestsController extends Controller
{
    /**
     * Display a new test.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $topics = Topic::inRandomOrder()->limit(10)->get();

        $questions = Question::inRandomOrder()->limit(10)->get();
        foreach ($questions as &$question) {
            $question->options = QuestionsOption::where('question_id', $question->id)->inRandomOrder()->get();
        }

        return view('tests.create', compact('questions'));
    }


    /**
     * Store a newly solved Test in storage with results.
     *
     * @param  \App\Http\Requests\StoreResultsRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $mark = 0;
        $totalMark = 0;
        foreach ($request->input('questions', []) as $key => $question) {
            $totalMark += Question::find($question)->grade;
            if (
                $request->input('answers.' . $question) != null
                && QuestionsOption::find($request->input('answers.' . $question))->correct
            ) {
                $mark += Question::find($question)->grade;
            }
        }

        if ($mark >= 50) {
            $result = 'success';
        } else {
            $result = 'fail';
        }

        $test = Test::create([
            'user_id' => Auth::user()->id,
            'result'  => $result,
            'mark' => $mark,
        ]);
        return redirect()->route('results.showRes',[$test->id]);
    }

}
