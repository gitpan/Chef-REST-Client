#--------------------------------------------------------------------#
# @class  : CHEF::Rest::Client::databag                              #
# @author : Bhavin Patel                                             #
#--------------------------------------------------------------------#

package CHEF::REST::Client::data;
use parent qw { CHEF::REST::Client::EndPoints };
use CHEF::REST::Client::databag;

$CHEF::REST::Client::data::VERSION = 1.0;

sub list 
{
    my $self = shift;
    my $databags = $self->___data___;
    
    foreach my $databag ( keys(%$databags) )
    {
    	push @{'___data_bags_list___'} , 
    		new CHEF::REST::Client::databag( 
    					'name' => $databag,
    					'url'  => $databags->{$databag}
    		      );
    }
	 return @{'___data_bags_list___'};
}  
sub details
{
  my $self = shift;
  my $data = $self->___data___;

  return $self->raw() unless ref $data eq 'HASH';
    
  return $data;
}  
  
1;

=pod

=head1 NAME 

CHEF::REST::Client::data

=head1 VERSION

1.0

=head1 SYNOPSIS

use CHEF::REST::Client::data;

$obj->data->list;
$obj->data->details;
$obj->data( 'abcusers' , 'webro' )->details;

=head1 DESCRIPTION

Chef data class. used internally contains methods to fetch data from Chef server.This will return an array of L<CHEF::REST::Client::databag> objects.

=head1 METHODS

=head2 list

list all the data elements from Chef Server

 $obj->data->list

=head2 details

fetch all the details about the data object saved in the Chef server.
internally calls raw() method of L<CHEF::REST::Client::EndPoint>

=head1 KNOWN BUGS

=head1 SUPPORT

open a github ticket or email comments to Bhavin Patel <mail4bhavin@yahoo.com>

=head1 COPYRIGHT AND LICENSE

This Software is free to use , licensed under : The Artisic License 2.0 (GPL Compatible)

=cut