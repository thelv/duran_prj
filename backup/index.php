<?php

    /**
    * FlxZipArchive, Extends ZipArchiv.
    * Add Dirs with Files and Subdirs.
    *
    * <code>
    *  $archive = new FlxZipArchive;
    *  // .....
    *  $archive->addDir( 'test/blub', 'blub' );
    * </code>
    */
    /*
    * (extended by thels@gmail.com)
    */    
    class FlxZipArchive extends ZipArchive {
        /**
         * Add a Dir with Files and Subdirs to the archive
         *
         * @param string $location Real Location
         * @param string $name Name in Archive
         * @author Nicolas Heimann
         * @access private
         **/
     
        public function addDir($location, $name) {
            if(! $this->addEmptyDir($name)) return false;
     
            if(! $this->addDirDo($location, $name)) return false;
            
            return true;
         } // EO addDir;
     
        /**
         * Add Files & Dirs to archive.
         *
         * @param string $location Real Location
         * @param string $name Name in Archive
         * @author Nicolas Heimann
         * @access private
         **/
     
        private function addDirDo($location, $name) {
            $name .= '/';
            $location .= '/';
     
            // Read all Files in Dir
            if(($dir = opendir ($location)) === false) return false;
            while ($file = readdir($dir))
            {
                if($file===false) return false;
                if ($file == '.' || $file == '..') continue;
     
                // Rekursiv, If dir: FlxZipArchive::addDir(), else ::File();
                $do = (filetype( $location . $file) == 'dir') ? 'addDir' : 'addFile';
                if(! $this->$do($location . $file, $name . $file)) return false;
            }
            
            return true;
        } // EO addDirDo();
    }

	function l($message)
	{
		echo "\r\n".$message;
		file_put_contents('log' ,"\r\n".date('Y.m.d_G-i-s').' '.$message, FILE_APPEND);
	}
	
    function scandir_($dir)
    {
        $list=scandir($dir, /*SCANDIR_SORT_DESCENDING*/ 1);
        foreach($list as $file)
        {
            if($file=='.' || $file=='..') continue;
            strpos($file, '.') && ($list_['files'][]=$file) || ($list_['folders'][]=$file);
        }        
        return $list_;
    }
	
	chdir(__DIR__);

	l("BEGIN");

	include 'settings.php';

	parse_str($argv[1], $p);
	
	if(isset($p['img']))
	{
		
		l('img');
		
		try
		{
			
			$dirImg=DIR_BASE.'/var/www/pbl/duran/dev/main/upload/img/orig';
			
			list($lastDir, $lastFile)=array_values(unserialize(file_get_contents('counter/last_img')));
			
			while(true)
			{
				$list=scandir_($dirImg.$lastDir_);
				if($list['folders'])
				{
					$lastDir_.='/'.$list['folders']['0'];
				}
				else
				{
					list($lastFile_)=explode('.', $list['files']['0'], 2);
					break;
				}
			}

			$archive = new FlxZipArchive;
			$imgBackupFile='img.'.date('Y.m.d_G-i-s').'.'.substr(md5(rand(0,1000000)), 0, 5).'.zip';
			if($archive->open($q='data/create/'.$imgBackupFile, ZipArchive::CREATE)!==true) die();    
			if(! $archive->addEmptyDir('img')) die();
			echo $q;
			
			while(true)
			{
				$list=scandir_($dirImg.$lastDir);
				foreach($list['files'] as $file)
				{
					if(strcmp($lastFile, (int)$file)>=0) break;
					echo "\r\n$file";
					if(! $archive->addFile($dirImg.$lastDir.'/'.$file, '/img'.$lastDir.'/'.$file)) die();
				}
				foreach($list['folders'] as $folder)
				{
					if(strcmp($lastFolder, $folder)>=0) break;
					echo "\r\n$lastDir/$folder";
					if(! $archive->addDir($dirImg.$lastDir.'/'.$folder, '/img'.$lastDir.'/'.$folder)) die();
				}
				$lastFile='';
				if(''==$lastDir)
				{            
					break;
				}
				preg_match('%(.*)\/(.+)%', $lastDir, $m);
				$lastDir=$m[1];
				$lastFolder=$m[2];
			}
			
			if(! $archive->close()) die();
			
			if(! rename(__DIR__.'/data/create/'.$imgBackupFile, __DIR__.'/data/download/'.$imgBackupFile))
			{
				l('ERROR');
			}
			
			l('success');
			
			file_put_contents('counter/last_img', serialize(array("dir"=>$lastDir_, "file"=>$lastFile_)));
		}
		catch(Exception $e)
		{
			l('ERROR: '.$e->getMessage());
		}
		
	}
	
	if(isset($p['db']))
	{
	
		l('db');
	
		$dbBackupFile='db.'.date('Y.m.d_G-i-s').'.'.substr(md5(rand(0,1000000)), 0, 5).'.sql';	
		shell_exec("mysqldump -u$dbLogin -p$dbPass $dbName > data/create/$dbBackupFile");
		
		if(! rename(__DIR__.'/data/create/'.$dbBackupFile, __DIR__.'/data/download/'.$dbBackupFile))
		{
			l('ERROR');
		}
		
	}
	
	l('END');
?>