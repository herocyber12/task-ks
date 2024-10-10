<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TransaksiRequest extends FormRequest
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
            'quantity' => 'required|numeric|min:1'
        ];
    }

    public function message()
    {
        return[
            'quantity.required' => 'Kolom ini wajib diisi',
            'quantity.numeric' => 'Kolom harus berupa angka',
            'quantity.min' => 'Minimal Pembelian 1'
        ];
    }
}
