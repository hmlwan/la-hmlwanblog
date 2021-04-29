<?php

namespace App\Http\Requests\Config;

use Illuminate\Foundation\Http\FormRequest;

class Store extends FormRequest
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
            'key'=>'required|unique:configs',
            'name'=>'required',
            'type'=>'required',
        ];
    }
    public function messages(){
        return [
            'key.required'=> 'key不能为空',
            'key.unique'=> 'key已存在',
            'name.required'=> '名称不能为空',
            'type.required'=> '类型不能为空',
        ];
    }
}
