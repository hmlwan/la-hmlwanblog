<?php

namespace App\Http\Requests\Article;

use Illuminate\Foundation\Http\FormRequest;

class Update extends FormRequest
{
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
            'category_id'=>'required',
            'title'=>'required',
            'tags'=>'required',
            'author'=>'required',
            'markdown'=>'required',
            'description'=>'required',
            'keywords'=>'required',
            'cover'=>'required',
        ];
    }
    public function messages(){
        return array(
            'category_id.required'=> '分类不能为空',
            'title.required'=> '标题不能为空',
            'tags.required'=> '标签不能为空',
            'author.required'=> '作者不能为空',
            'markdown.required'=> '内容不能为空',
            'description.required'=> '描述不能为空',
            'keywords.required'=> '关键字不能为空',
            'cover.required'=> '封面不能为空',
        );
    }
}
