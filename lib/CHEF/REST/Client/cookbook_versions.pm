#--------------------------------------------------------------------#
# @class  : CHEF::Rest::Client::cookbook_versions                    #
# @author : Bhavin Patel                                             #
#--------------------------------------------------------------------#

package CHEF::REST::Client::cookbook_versions;

use CHEF::REST::Client::cookbook_version;

$CHEF::REST::Client::cookbook_versions::VERSION = 1.0;

sub new
{
    my $class = shift;
    my $list_of_cookbook_versions = shift;

	 foreach my $v (@$list_of_cookbook_versions )
	 {
	 	push @{ '___cookbook_versions___' } 
	 	   , new CHEF::REST::Client::cookbook_version(
	 										'url'     => $v->{'url'    },
	 										'version' => $v->{'version'}
	 							    	);
	 }
	 return \@{'___cookbook_versions___'};
	
}
1;

=pod 

=head1 NAME

CHEF::REST::Client::cookbook_versions

=head1 VERSION

1.0

=head1 SYNOPSIS

 my $obj = new CHEF::REST::Client::cookbook_versions
               ( @list_of_cookbook_versions);
   
=head1 DESCRIPTION

used internally by other classes like L<CHEF::REST::Client::cookbook>

=head1 METHODS

=head2 Constructor

returns array of L<CHEF::REST::Client::cookbook_versions> objects

=head1 KNOWN BUGS

=head1 SUPPORT

open a github ticket or email comments to Bhavin Patel <bpatel10@nyit.edu>

=head1 COPYRIGHT AND LICENSE

This Software is free to use , licensed under : The Artisic License 2.0 (GPL Compatible)

=cut