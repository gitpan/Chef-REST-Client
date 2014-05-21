#--------------------------------------------------------------------#
# @class  : CHEF::Rest::Client::nodes                                #
# @author : Bhavin Patel                                             #
#--------------------------------------------------------------------#

package CHEF::REST::Client::nodes;
use parent qw { CHEF::REST::Client::EndPoints };

use CHEF::REST::Client::node;

$CHEF::REST::Client::nodes::VERSION = 1.0;

sub list 
  {
    my $self = shift;
    my $list_of_nodes = $self->___data___;

    foreach my $n ( keys(%$list_of_nodes) ){
      my $node = new CHEF::REST::Client::node( 
      						'name' => $n,  
                        'url'  => $list_of_nodes->{$n} 
                 );
      push @{'___nodes_list___'} , $node;
    }
    return @{'___nodes_list___'};
  }
  
sub details
{
  my $self = shift;
  my $data = $self->___data___;

  return $self->raw() unless ref $data eq 'HASH';

#  return $data;
  
  return new CHEF::REST::Client::node(
  		'name' => $data->{'name'},
  		'environment' => $data->{'chef_environment'},
  		'automatic'   => $data->{'automatic'},
  		'override'    => $data->{'override' },
  		'default'     => $data->{'default'  },
  		'run_list'    => $data->{'run_list' }
  );
	
    
}  
  
1;

=pod

=head1 NAME 

CHEF::REST::Client::nodes

=head1 VERSION

1.0

=head1 SYNOPSIS

 use CHEF::REST::Client::nodes;

 $obj->nodes->list;
 $obj->nodes('server1')->details;
  
=head1 DESCRIPTION

Class that represents collection of nodes 

=head1 METHODS

=head2 list

return list of nodess, array of L<CHEF::REST::Client::node> objects.

=head2 details ( $details )

retun detail about a perticular node.

=head1 KNOWN BUGS

=head1 SUPPORT

open a github ticket or email comments to Bhavin Patel <mail4bhavin@yahoo.com>

=head1 COPYRIGHT AND LICENSE

This Software is free to use , licensed under : The Artisic License 2.0 (GPL Compatible)

=cut
