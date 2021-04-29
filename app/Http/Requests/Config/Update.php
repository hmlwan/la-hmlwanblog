<?php

namespace App\Http\Requests\Config;

use Illuminate\Foundation\Http\FormRequest;

class Update extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'key'=>'required',
            'name'=>'required',
            'value' => 'required'
        ];
    }
    public function messages(){
        return [
            'key.required'=> 'key不能为空',
            'name.required'=> '名称不能为空',
            'value.required' => 'value不能为空'
        ];
    }
}
