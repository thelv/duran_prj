var fs=require('fs');

module.exports={
	db: {
		name: 'duran_prod_'+(parseInt(fs.readFileSync(__dirname+'/../../../../../www/pbl/duran/prod/db_number'))+1),
		login: 'root',
		pass: '123456'
	},
	encryptionCode: 
		'w4 w98y t298 F#$(&UIJF SFU@$( *R#UEIUFWFsdik23ra 4t34($T&EF ($# UREOFU#($',
	port: 
		'8081'
};