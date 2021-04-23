<?php

namespace App\Http\Requests\Category;

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
            'name'=>'required',
            'keywords'=>'required',
            'desc'=>'required',
            'sort'=>'required',
        ];
    }
    public function messages(){
        return [
            'name.required'=> '名称不能为空',
            'keywords.required'=> '关键词不能为空',
            'desc.required'=> '关键词不能为空',
            'sort.required'=> '排序不能为空',
        ];
    }
}
