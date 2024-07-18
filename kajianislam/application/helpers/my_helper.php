<?php
if (!function_exists('get_excerpt')) {
    function get_excerpt($text, $word_limit = 50)
    {
        $words = explode(' ', $text);
        if (count($words) > $word_limit) {
            $excerpt = implode(' ', array_slice($words, 0, $word_limit)) . '...';
        } else {
            $excerpt = $text;
        }
        return $excerpt;
    }
}

if (!function_exists('strip_html_tags')) {
    function strip_html_tags($text)
    {
        return strip_tags($text);
    }
}
