#--------------------------------------------------------------------#
# CHEF::Rest::Client Test Cases                                      #
# @author : Bhavin Patel                                             #
#--------------------------------------------------------------------#

# requried modules

use Test::More;

subtest 'Additional required modules' => sub {
	map 
	{
		use_ok( $_ );
	}
	(
		'File::Basename',
		'File::Spec::Functions',
		'parent',
		'Crypt::OpenSSL::RSA',
		'File::Slurp',
		'LWP::UserAgent',
		'Mojo::JSON',
		'Module::Load',
		'vars',
		'DateTime',
		
	);

};

subtest 'all module check' => sub {

	my @base;
		use File::Basename qw { dirname };
		use File::Spec::Functions qw { splitdir rel2abs };

  		@base = ( splitdir( rel2abs ( dirname ( __FILE__ ) ) ) );
  		pop @base;    
  		push @INC , join  '/', @base, 'lib';

	map
	{
		use_ok($_);
	}
	(
		'CHEF',

		'CHEF::Encoder',
		'CHEF::Header',
		'CHEF::REST',

		'CHEF::REST::Client',

		'CHEF::REST::Client::search',
		
		'CHEF::REST::Client::recipe',

		'CHEF::REST::Client::runlist',
		
		'CHEF::REST::Client::clients',
				
		'CHEF::REST::Client::EndPoints',

		'CHEF::REST::Client::sandboxes',
		
		'CHEF::REST::Client::principals',

		'CHEF::REST::Client::envrunlist',

		'CHEF::REST::Client::role',
		'CHEF::REST::Client::roles',

		'CHEF::REST::Client::node',
		'CHEF::REST::Client::nodes',		

		'CHEF::REST::Client::data',
		'CHEF::REST::Client::databag',
		
		'CHEF::REST::Client::cookbook',
		'CHEF::REST::Client::cookbooks',

		'CHEF::REST::Client::attribute',
		'CHEF::REST::Client::attributes',

		'CHEF::REST::Client::environment',
		'CHEF::REST::Client::environments',
		
		'CHEF::REST::Client::cookbook_version',
		'CHEF::REST::Client::cookbook_versions',

	);

};

done_testing;