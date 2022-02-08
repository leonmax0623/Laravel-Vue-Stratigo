<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Mail extends Model
{
      public static $from="info@startego.com";
    
      public static function sendMail($template,$subject,$data,$user,$files= array()){
       
		return \Mail::send($template, $data, function($message) use($user,$subject,$files) {
            $message->to($user->email, $user->full_name)->subject($subject);
            $message->from(self::$from,config('app.name')); 
			if(count($files) > 0) {
				foreach($files as $file) {
					$message->attach(@url($file['document']));
				}
			}
		});
      }
      public static function sendMailToAdmin($template,$subject,$data,$user,$files= array()){
       
            return \Mail::send($template, $data, function($message) use($user,$subject,$files) {
            $message->to($user->email, $user->full_name)->subject($subject);
            $message->from(self::$from,config('app.name')); 
               if(count($files) > 0) {
                        foreach($files as $file) {
                            $message->attach(@url($file['document']));
                        }
                    }
            });
      }
}
