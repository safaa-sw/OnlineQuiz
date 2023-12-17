<?php

use App\User;
use Illuminate\Database\Seeder;

class UserSeed extends Seeder
{
    public function run()
    {
        DB::table((new User)->getTable())->truncate();

        User::insert([
            [
                'id'             => 1,
                'name'           => 'Admin',
                'email'          => 'admin@admin.com',
                'password'       => Hash::make('12345678'),
                'role_id'        => 1,
                'remember_token' => '',
            ],
            [
                'id'             => 2,
                'name'           => 'safaa stud',
                'email'          => 'safaa@gmail.com',
                'password'       => Hash::make('12345678'),
                'role_id'        => 2,
                'remember_token' => '',
            ],
            
        ]);
    }
}
