<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProfilRequest extends FormRequest
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
                'name' => 'required|string|max:255',
                'alamat' => 'nullable|string|max:255',
                'no_hp' => 'nullable|min:8|max:13',
                'foto' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ];
    }
}
