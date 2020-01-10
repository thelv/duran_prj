<?

	include 'settings.php';
	define('DIR_FILES', DIR_BASE.'/var/www/pbl/duran');
	define('DIR_NODEJS', DIR_BASE.'/var/prj/duran/nodejs/exec');
	error_reporting(0);
	chdir(__DIR__);

	function l($message)
	{
		echo $message."\r\n";
		file_put_contents('log' ,"\r\n".$message, FILE_APPEND);
	}	
	
	function err($error)
	{
		throw new Exception($error);
	}
	
	function moveDir($from, $to, $ignoreNotExists)
	{
		l("\r\nmove dir $from -> $to");
		if(! file_exists($from))
		{
			l('dir not exists');
			if(! $ignoreNotExists) err('move dir error - dir not exists');
			return;
		}
		if(! rename($from, $to))
		{
			err('move dir error');
		}
	}
	
	function incDbNumber()
	{
		l("\r\ninc db number");
		$file=DIR_FILES.'/prod/db_number';
		if(! $n=(int)file_get_contents($file)) err('inc db number error - file get contents error');
		if(! file_put_contents($file, $n+1)) err('inc db number error - file put contents error');
	}
	
	function scandir_($dir)
    {
        if(($list=scandir($dir)) === false) err('scandir_ error');
        foreach($list as $file)
        {
            if($file=='.' || $file=='..') continue;
            if(is_file($dir.'/'.$file))
			{
				$list_['files'][]=$file;
			}
			else
			{
				$list_['folders'][]=$file;
			}
        }        
        return $list_;
    }
	
	function copyDir($from, $to, $ignoreNotExists, $firstCall=true)
	{		
		static $counter=0;
		if($firstCall)
		{
			$counter=0;
			l("\r\ncopy dir $from -> $to");
			if(! is_dir($from))
			{
				l('dir not exists');
				if(! $ignoreNotExists) err('copy dir error - dir not exists');
				return;
			}
			if(! mkdir($to)) err('make dir error - cant make destination dir ');
		}
		if(is_dir($from))
		{
			$counter++;
			$files=scandir_($from);
			foreach($files['files'] as $file)
			{
				$counter++;
				if(! copy($from.'/'.$file, $to.'/'.$file)) err('copy dir error - copy file error');
			}
			foreach($files['folders'] as $folder)
			{
				if(! mkdir($to.'/'.$folder)) err('copy dir error - cant make sub dir');
				copyDir($from.'/'.$folder, $to.'/'.$folder, false, false);
			}
		}
		else
		{
			err("copy dir error - source($from) is not dir");
		}
		if($firstCall)
		{
			l($counter.' files and dirs was copyd');
		}
	}	
	
	function delFile($file)
	{
		l("\r\ndelete file $file");
		if(! file_exists($file))
		{
			l('file not exists');
			return;
		}
		if(! unlink($file))
		{
			err('delete file error');
		}
	}
	
	function copyFile($from, $to)
	{
		l("\r\ncopy file $from -> $to");
		if(! copy($from, $to))
		{
			err('copy file error');
		}
	}
	
	function renameDb($from, $to)
	{
		l("\r\nrename db $from -> $to");
		mysql_query($q="rename database `$from` to `$to`");
		echo $q;
		if($e=mysql_error())
		{
			err("rename db error (\"$e\")");
		}
	}
	
	function copyDb($to)
	{	
		l("\r\ncopy db to $to");	
		$m=shell_exec('php '.DIR_FILES."/$to/index.php \"type=copy_tables\"");
		l("output: (\"$m\")");
		if($m!=='success')
		{	
			err("copy db error (\"$m\")");
		}
	}
		
	function connectDb()
	{
		l("\r\nconnect db");
		mysql_connect('127.0.0.1', DB_LOGIN, DB_PASS);
		if($e=mysql_error())
		{
			err("connect db error (\"$e\")");
		}
	}
	
	function gitCommit($message)
	{
		//shell_execute();
	}
	
	function nodejsStart($to, $startOrStop)
	{
		if($startOrStop)
		{
			l("\r\nnodejs start - start");
			$m=shell_exec('forever stop '.DIR_NODEJS."/$to/stop/server.js");
			$m=shell_exec('forever start '.DIR_NODEJS."/$to/main/server.js");
			//l("\r\nnodejs start - start - shell output:\r\n$m\r\n");
		}
		else
		{			
			l("\r\nnodejs start - stop");
			$m=shell_exec('forever stop '.DIR_NODEJS."/$to/main/server.js");
			$m=shell_exec('forever start '.DIR_NODEJS."/$to/stop/server.js");
			//l("\r\nnodejs start - stop - shell output:\r\n$m\r\n");		
		}
	}
		
	function serverStart($to, $startOrStop)
	{		
		if($startOrStop)
		{
			l("\r\nserver start - start");
			if(! unlink(DIR_FILES."/$to/stop_"))
			{
				err("server start - start - unlink file error");
			}
			nodejsStart($to, true);
		}
		else
		{			
			l("\r\nserver start - stop");	
			nodejsStart($to, false);
			sleep(1);
			echo DIR_FILES."/$to/stop_";
			if(! file_put_contents(DIR_FILES."/$to/stop_", 'stop'))
			{
				err("server start - stop - create file error");
			}
		}
	}

	l("\r\nBEGIN ".date('Y.m.d G:i:s'));

	parse_str($argv[1], $p);

	try
	{
	
		if(isset($p['copy_to_prod']))
		{
		
			if(isset($p['files']) || isset($p['nodejs']))
			{
				$commit=true;
			}
		
			if($commit)
			{
				gitCommit("after \"{$p["commit"]}\"");
				l("\r\nCOMMIT BEFORE");
			}
		
			if($commit) gitCommit("before \"{$p["commit"]}\"");
		
			if(! isset($p['start']))
			{
				l("\r\nSTOP SERVER");
				serverStart('prod', false);
			}
			
			if(isset($p['db']))
			{
				l("\r\nCOPY DB");
				copyDb('copy');
				//connectDb();
				//renameDb('duran', 'duran_old_'.date('Y_m_d_H_i_s').'_'.substr(md5(rand(0,1000000)), 0, 5));
				//renameDb('duran_copy', 'duran');
				incDbNumber();
			}
			
			if(isset($p['files']))
			{
				l("\r\nCOPY FILES");
				$dirOld=DIR_FILES."/old/".date('Y_m_d_H-i-s').'_'.substr(md5(rand(0,1000000)), 0, 5);
				mkdir($dirOld, 777, true);
				moveDir(DIR_FILES.'/prod/main', $dirOld.'/main', true);
				moveDir(DIR_FILES.'/copy/main', DIR_FILES.'/prod/main');
			}						
			
			if(isset($p['nodejs']))
			{
				l("\r\nCOPY NODEJS");
				moveDir(DIR_NODEJS.'/prod/main', DIR_NODEJS.'/old/'.date('Y.m.d_G-i-s').'.'.substr(md5(rand(0,1000000)), 0, 5), true);
				moveDir(DIR_NODEJS.'/copy/main', DIR_NODEJS.'/prod/main');
			}						
			
			if(! isset($p['stop']))
			{
				l("\r\nSTART SERVER");
				serverStart('prod', true);
			}			
			
			if($commit)
			{
				gitCommit("after \"{$p["commit"]}\"");
				l("\r\nCOMMIT AFTER");
			}
		
		}
		elseif($p['to'])
		{
			if($p['to']!=='copy' && strpos($p['to'], 'dev/')!==0)
			{
				err('wrong request');
			}
			
			if(isset($p['stop']))
			{
				l("\r\nSTOP SERVER \"{$p['to']}\"");
				serverStart($p['to'], false);
			}
			
			if(isset($p['files']))
			{			
				l("\r\nCOPY FILES \"{$p['from']}\" -> \"{$p['to']}\"");
				$dirGarbage=DIR_FILES."/garbage/".date('Y_m_d_H-i-s').'_'.substr(md5(rand(0,1000000)), 0, 5)."/{$p['to']}";
				mkdir($dirGarbage, 777, true);
				moveDir(DIR_FILES."/{$p['to']}/main", $dirGarbage.'/main', true);
				copyDir(DIR_FILES."/{$p['from']}/main", DIR_FILES."/{$p['to']}/main");
				delFile(DIR_FILES."/{$p['to']}/copySettings.php", true);
				copyFile(DIR_FILES."/{$p['from']}/copySettings.php", DIR_FILES."/{$p['to']}/copySettings.php");
			}
			
			if(isset($p['db']))
			{
				l("\r\nCOPY DB \"{$p['to']}\"");
				copyDb($p['to']);
			}
			
			if(isset($p['nodejs']))
			{
				l("\r\nCOPY NODEJS \"{$p['from']}\" -> \"{$p['to']}\"");
				$dirGarbage=DIR_NODEJS."/garbage/".date('Y_m_d_H-i-s').'_'.substr(md5(rand(0,1000000)), 0, 5)."/{$p['to']}";
				mkdir($dirGarbage, 777, true);
				moveDir(DIR_NODEJS."/{$p['to']}/main", $dirGarbage.'/main', true);
				copyDir(DIR_NODEJS."/{$p['from']}/main", DIR_NODEJS."/{$p['to']}/main");
			}			
			
			if(isset($p['start']))
			{
				l("\r\nSTART SERVER \"{$p['to']}\"");
				serverStart($p['to'], true);
			}
							
		}
		else
		{
			l('no request');
		}
		
	}
	catch(Exception $e)
	{
		l("\r\n\r\nERROR: ".$e->getMessage());
	}
	
	l("\r\nEND ".date('Y.m.d G:i:s'));
	
?>