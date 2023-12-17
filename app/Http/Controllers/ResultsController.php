<?php

namespace App\Http\Controllers;

use Auth;
use App\Test;
use Illuminate\Http\Request;
use App\Http\Requests\StoreResultsRequest;
use App\Http\Requests\UpdateResultsRequest;

class ResultsController extends Controller
{
    public function __construct()
    {
        //$this->middleware('student');
    }

    /**
     * Display a listing of Result.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $results = Test::all();
        return view('results.index', compact('results'));
    }

    public function showRes($id)
    {
        $test = Test::find($id);

        return view('results.showRes', compact('test'));
    }

    /**
     * Display Result.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
}
