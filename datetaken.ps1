# Organizes photos by date taken.
# Assumes destination folders have
# already been created.
# Originally used to organize large
# single folder iPhone photo backups. 
#
# Copy destination folder names
# and use the command prompt: 
# $ md [paste folder names]
#
# 2018_01_JAN 2018_02_FEB 2018_03_MAR 2018_04_APR 2018_05_MAY 2018_06_JUN 2018_07_JUL 2018_08_AUG 2018_09_SEP 2018_10_OCT 2018_11_NOV 2018_12_DEC 2019_01_JAN 2019_02_FEB 2019_03_MAR 2019_04_APR 2019_05_MAY 2019_06_JUN 2019_07_JUL 2019_08_AUG 2019_09_SEP 2019_10_OCT 2019_11_NOV 2019_12_DEC 2020_01_JAN 2020_02_FEB 2020_03_MAR 2020_04_APR 2020_05_MAY 2020_06_JUN 2020_07_JUL 2020_08_AUG 2020_09_SEP 2020_10_OCT 2020_11_NOV 2020_12_DEC "NO DATE TAKEN"

Write-Host "START"

$cnt = 0
$folder__path = "D:\PATH\TO\PHOTOS\"
$files = Get-ChildItem $folder__path 

foreach ($file in $files) {
	$cnt++
	$shellObject = New-Object -ComObject Shell.Application
	$directoryObject = $shellObject.NameSpace( $file.Directory.FullName )
	$fileObject = $directoryObject.ParseName( $file.Name )
	$property = 'Date taken'

	for(
		$index = 5;
		$directoryObject.GetDetailsOf( $directoryObject.Items, $index ) -ne $property;
		++$index ) { }

	$value = $directoryObject.GetDetailsOf( $fileObject, $index )
	$month = $value[1] + $value[2]
	$dest = "D:\PATH\TO\DESTINATION\FOLDERS\"

	if ($value -match '2018' -eq 1) 
	{
		switch ($month) 
		{
			"1/" {$dest += "2018_01_JAN"; Break;}
			"2/" {$dest += "2018_02_FEB"; Break;}
			"3/" {$dest += "2018_03_MAR"; Break;}
			"4/" {$dest += "2018_04_APR"; Break;}
			"5/" {$dest += "2018_05_MAY"; Break;}
			"6/" {$dest += "2018_06_JUN"; Break;}
			"7/" {$dest += "2018_07_JUL"; Break;}
			"8/" {$dest += "2018_08_AUG"; Break;}
			"9/" {$dest += "2018_09_SEP"; Break;}
			"10" {$dest += "2018_10_OCT"; Break;}
			"11" {$dest += "2018_11_NOV"; Break;}
			"12" {$dest += "2018_12_DEC"; Break;}
			default {$dest += "NO DATE TAKEN";}
		}
	}
	elseif ($value -match '2019' -eq 1) 
	{
		switch ($month) 
		{
			"1/" {$dest += "2019_01_JAN"; Break;}
			"2/" {$dest += "2019_02_FEB"; Break;}
			"3/" {$dest += "2019_03_MAR"; Break;}
			"4/" {$dest += "2019_04_APR"; Break;}
			"5/" {$dest += "2019_05_MAY"; Break;}
			"6/" {$dest += "2019_06_JUN"; Break;}
			"7/" {$dest += "2019_07_JUL"; Break;}
			"8/" {$dest += "2019_08_AUG"; Break;}
			"9/" {$dest += "2019_09_SEP"; Break;}
			"10" {$dest += "2019_10_OCT"; Break;}
			"11" {$dest += "2019_11_NOV"; Break;}
			"12" {$dest += "2019_12_DEC"; Break;}
			default {$dest += "NO DATE TAKEN";}
		}
	}
	elseif ($value -match '2020' -eq 1) 
	{
		switch ($month) 
		{
			"1/" {$dest += "2020_01_JAN"; Break;}
			"2/" {$dest += "2020_02_FEB"; Break;}
			"3/" {$dest += "2020_03_MAR"; Break;}
			"4/" {$dest += "2020_04_APR"; Break;}
			"5/" {$dest += "2020_05_MAY"; Break;}
			"6/" {$dest += "2020_06_JUN"; Break;}
			"7/" {$dest += "2020_07_JUL"; Break;}
			"8/" {$dest += "2020_08_AUG"; Break;}
			"9/" {$dest += "2020_09_SEP"; Break;}
			"10" {$dest += "2020_10_OCT"; Break;}
			"11" {$dest += "2020_11_NOV"; Break;}
			"12" {$dest += "2020_12_DEC"; Break;}
			default {$dest += "NO DATE TAKEN";}
		}
	}
	else 
	{
		$dest += "NO DATE TAKEN"
	}

	Write-Host " "
	Write-Host "copied " $cnt
	Write-Host "date taken: " $value
	Write-HOst "month: " $month
	Write-Host "dest: " $dest
	Copy-Item -Path $file.FullName -Destination $dest 
}

echo $cnt
Write-Host "END"
