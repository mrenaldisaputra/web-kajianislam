<?php

class Auth_model extends CI_Model
{
    private $_table = "tb_admin";
    const SESSION_KEY = 'tb_admin_id';

    public function rules()
    {
        return [
            [
                'field' => 'email',
                'label' => 'Email',
                'rules' => 'required|trim|valid_email'
            ],

            [
                'field' => 'password',
                'label' => 'Password',
                'rules' => 'required|trim'
            ]
        ];
    }



}