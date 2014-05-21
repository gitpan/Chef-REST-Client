#--------------------------------------------------------------------#
# @class  : CHEF::Rest::Client::roles                                #
# @author : Bhavin Patel                                             #
#--------------------------------------------------------------------#

package CHEF::REST::Client::roles;

use parent qw { CHEF::REST::Client::EndPoints };
use CHEF::REST::Client::role;
use CHEF::REST::Client::runlist;
use CHEF::REST::Client::envrunlist;
use CHEF::REST::Client::attributes;

$CHEF::REST::Client::roles::VERSION = 1.0;

# this module will be passed tha json parsed hash 
# under ___data__() or variable.
# process it depending on the content expected.

sub list 
{
    my $self = shift;
    my $list_of_roles = $self->___data___;
	 return undef if $self->___data___->{'chef_type'};
	#return $self->___data___;
	
    foreach my $r ( keys(%$list_of_roles) ){
      my $role = new CHEF::REST::Client::role
      				( 
      					'name' => $r,  
                     'url'  => $list_of_roles->{$r},
                  );
                  
      push @{'___roles_list___'} , $role;
    }
    return @{'___roles_list___'};
}

sub details
{
  my $self = shift;
  my $data = $self->___data___;

  return $self->raw() unless ref $data eq 'HASH';
  
  return new CHEF::REST::Client::role(
  				'name'                => $data->{'name'},
  				'run_list'            => new CHEF::REST::Client::runlist( $data->{'run_list'} ), #convert it to class
  				'env_run_lists'       => [map { 
  				                            new CHEF::REST::Client::envrunlist( 
  				                                     env_name => $_,
  				                                     run_list => new CHEF::REST::Client::runlist(
  				                                     					$data->{'env_run_lists'}->{$_}
  				                                     				 )	
  				                                )
  				                             } keys( %{ $data->{'env_run_lists'} } ) ], #convert it to class
  				'description'         => $data->{'description'},
  				'default_attributes'  => new CHEF::REST::Client::attributes($data->{'default_attributes'}),
  				'override_attributes' => new CHEF::REST::Client::attributes($data->{'override_attributes'}),
  			);

}
  
1;

=pod

=head1 NAME 

CHEF::REST::Client::roles

=head1 VERSION

1.0

=head1 SYNOPSIS

 use CHEF::REST::Client::roles;

 $obj->roles->list;
 $obj->roles( 'devserver-role' )->details;
  
=head1 DESCRIPTION

Class that represents collection of roles 

=head1 METHODS

=head2 list

return list of roles, array of L<CHEF::REST::Client::roles> objects.

=head2 details

return details about a particular role. or dump raw hash.

=head1 KNOWN BUGS

=head1 SUPPORT

open a github ticket or email comments to Bhavin Patel <mail4bhavin@yahoo.com>

=head1 COPYRIGHT AND LICENSE

This Software is free to use , licensed under : The Artisic License 2.0 (GPL Compatible)

=cut
