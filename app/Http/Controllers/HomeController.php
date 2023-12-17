<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Question;
use App\Result;
use App\Test;
use App\User;
use Auth;
use DB;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        $questions = Question::count();
        $users = User::all();
        $studentCount = 0;
        foreach ($users as $user) {
            if ($user->role_id != 1)
                $studentCount++;
        }
        $users = $studentCount;
        $studTest= Test::where('user_id','=',Auth::user()->id)->get();
        $results = null;
        return view('home', compact('questions', 'users','studTest'));
    }
}
