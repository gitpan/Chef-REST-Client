#--------------------------------------------------------------------#
# @class  : CHEF::Rest::Client::environments                         #
# @author : Bhavin Patel                                             #
#--------------------------------------------------------------------#

package CHEF::REST::Client::environments;
use parent qw { CHEF::REST::Client::EndPoints };

use CHEF::REST::Client::environment;
use CHEF::REST::Client::attributes;

$CHEF::REST::Client::environments::VERSION = 1.0;

# this module will be passed tha json parsed hash 
# under ___data__() or variable.
# process it depending on the content expected.

sub list 
{
    my $self = shift;
    my $list_of_environments = $self->___data___;
	 return undef if $self->___data___->{'chef_type'} eq 'environment';
	
    foreach my $e ( keys(%$list_of_environments) ){
      my $environment = new CHEF::REST::Client::environment
      				( 
      					'name' => $e,
                     'url'  => $list_of_environments->{$e},
                  );
                  
      push @{'___environments_list___'} , $environment;
    }
    return @{'___environments_list___'};
}

sub details
{
  my $self = shift;
  my $data = $self->___data___;

  return $self->raw() unless ref $data eq 'HASH' && $data->{'name'};
  return new CHEF::REST::Client::environment (
  					'name'                => $data->{'name'       },
  					'description'         => $data->{'description'},
  					'default_attributes'  => new CHEF::REST::Client::attributes( $data->{'default_attributes' } ),
  					'override_attributes' => new CHEF::REST::Client::attributes( $data->{'override_attributes'} ),
					'cookbook_versions'   => $data->{'cookbook_versions'}  					
         );  
}
 
1;

=pod

=head1 NAME 

CHEF::REST::Client::environments

=head1 VERSION

1.0

=head1 SYNOPSIS

 use CHEF::REST::Client::environments;

 $obj->environments->list;
 $obj->environments('dev')->details;
  
=head1 DESCRIPTION

Class that represents collection of environments 

=head1 METHODS

=head2 list

return list of environments, array of L<CHEF::REST::Client::environment> objects.

=head2 details ( $details )

retun detail about a perticular environment.

=head1 KNOWN BUGS

=head1 SUPPORT

open a github ticket or email comments to Bhavin Patel <mail4bhavin@yahoo.com>

=head1 COPYRIGHT AND LICENSE

This Software is free to use , licensed under : The Artisic License 2.0 (GPL Compatible)

=cut