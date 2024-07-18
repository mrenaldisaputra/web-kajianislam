<?php
if (!function_exists('datetime_to_local')) {
    function datetime_to_local($datetime)
    {
        $timezone = 'Asia/Jakarta'; // Ganti dengan zona waktu yang sesuai
        $dateTime = new DateTime($datetime, new DateTimeZone($timezone));
        return $dateTime->format('Y-m-d\TH:i');
    }
}