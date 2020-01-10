<?php

	function l($mes)
	{
		echo "$mes\r\n";
		file_put_contents(__DIR__.'/log.txt', date('Y.m.d_G-i-s')." $mes\r\n", FILE_APPEND);
	}


	l('START');

	$host='main.duran.thelv.ru';
	$login='duran_backup_download';
	$pass='r4ytDTXde5z8qz6E';
		
	if(! ($connection=ssh2_connect($host, 22))) die('Connection failed');
	
	if(! ssh2_auth_password($connection, $login, $pass)) die('auth failed');
	
	$sftp = ssh2_sftp($connection);
	
	$handle = opendir($dir="ssh2.sftp://$sftp/download");
       while(($file=readdir($handle))!==false) 
	{
		if ($file!=='garbage' && $file!=='.' && $file!=='..' && ! is_dir($file))
		{
			$files[]=$file;
		}
       }
	closedir($handle); 
	
	foreach($files as $file)
	{
		$remote = @fopen("ssh2.sftp://{$sftp}/download/$file", 'r');
		$local = @fopen(__DIR__."/data/$file", 'w');
		if(! $local || ! $remote)
		{
			l('ERROR local remote');	
			die();
		}

		$read = 0;
		$filesize = filesize("ssh2.sftp://{$sftp}/download/{$file}");
	    	while ($read < $filesize && ($buffer = fread($remote, min($filesize - $read, 100000))))
		{
        		$read += strlen($buffer);
        		if (fwrite($local, $buffer) === FALSE)
        		{
            			l("ERROR Unable to write to local file: $file");
				die();
        		}
		}

		fclose($local);
		fclose($remote);

		if(! ssh2_sftp_rename($sftp, "/download/$file", "/download/garbage/$file"))
		{
			l('ERROR rename');
			die();
		}
    }

    l('END');
    l('');


?>