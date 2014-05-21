#--------------------------------------------------------------------#
# @class  : CHEF::Rest::Client::runlist                              #
# @author : Bhavin Patel                                             #
#--------------------------------------------------------------------#

package CHEF::REST::Client::runlist;
use CHEF::REST::Client::recipe;

$CHEF::REST::Client::runlist::VERSION = 1.0;

sub new
{
	my $class = shift;
	my ($param) = (@_);
	my $self  = {};
	bless $self, $class;
	
	return [ map { new CHEF::REST::Client::recipe($_) } @$param ];
	
}

1;


=pod

=head1 NAME 

CHEF::REST::Client::runlist

=head1 VERSION

1.0

=head1 SYNOPSIS

 use CHEF::REST::Client::runlist;

 my $obj = new CHEF::REST::Client::runlist;
  
=head1 DESCRIPTION

Class that represents chef runlist
returns a map of L<CHEF::REST::Client::recipe> class. 

=head1 METHODS

=head2 Constructor

returns map of CHEF::REST::Client::recipe 

=head1 KNOWN BUGS

=head1 SUPPORT

open a github ticket or email comments to Bhavin Patel <mail4bhavin@yahoo.com>

=head1 COPYRIGHT AND LICENSE

This Software is free to use , licensed under : The Artisic License 2.0 (GPL Compatible)

=cut

