<?php
function success($message, $url = '', $time = 3) {
    return view('common.jump')->with([
        'message' => $message,
        'url' => $url,
        'jumpTime' => 3
    ]);
}

function error($message, $url = '', $time = 3) {
    return success($message, $url, $time);
}
