use ExtUtils::MakeMaker;

WriteMakefile
(
	NAME         => 'Chef::REST::Client',
	AUTHOR       => 'Bhavin Patel <bpatel10@nyit.edu>',
	VERSION_FROM => 'lib/Chef/REST/Client.pm',
	PREREQ_PM    => {
				          'Mojo::JSON'            => 0,
				          'File::Slurp'           => 0,
				          'Module::Load'          => 0,
				          'LWP::UserAgent'        => 0,
				          'File::Basename'        => 0,
				          'Crypt::OpenSSL::RSA'   => 0,
				          'File::Spec::Functions' => 0,
	                },
   dist         => { 
                       COMPRESS => 'gzip -9f', 
                       SUFFIX   => 'gz'
                   },
   INSTALLDIRS  => 'perl',
   ABSTRACT     => 'Interface for Chef Clients REST API',
   BUILD_REQUIRES 
                => {
                       'English'    => 0,
                       'Test::More' => 0,
                       'utf8'       => 0,
                   },
   test         => {
                       'RECURSIVE_TEST_FILES' => 1,
                   }
);