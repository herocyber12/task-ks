<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Http\Exceptions\HttpResponseException;

class AuthRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'email' => 'required|email',
            'password' => 'required|min:8', 
            'name' => request()->routeIs('registrasi') ?  'required|string' : '', 

        ];
    }

    public function message()
    {
        return [
            'email.required' => 'Kolom Email Wajib Diisi',
            'email.email' => 'Kolom email harus menggunakan @',
            'password.min' => 'Minimal Password 8 Karakter',
            'password.required' => 'Kolom Password Wajib Diisi',
            'nama.required' => 'Kolom Nama Wajib Diisi',
            'nama.string' => 'Nama harus berupa huruf'
        ];
    }
}
