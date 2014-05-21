#--------------------------------------------------------------------#
# @class  : CHEF::Rest::Client::attributes                           #
# @author : Bhavin Patel                                             #
#--------------------------------------------------------------------#

package CHEF::REST::Client::attributes;
use CHEF::REST::Client::attribute;

$CHEF::REST::Client::attributes::VERSION = 1.0;

sub new
{
	my $class = shift;
	my $param = shift;
	my $self = {};
	bless $self, $class;
	$self->array_parse($param);
	$self->parse( $param );
	return $self->{'___collection___'};
}

sub array_parse
{
	my $self = shift;
	my $param = shift;
   return $self->{'___collection___'} unless ref $param eq 'ARRAY';
	map { $self->parse( $_ );  } @$param;
}

sub parse 
{
	my $self  = shift;
	my $param = shift;

	return  unless ref $param eq 'HASH';
	
		foreach my $k ( keys (%$param ) )
		{
			if ( ref $param->{$k} eq 'HASH' )
			{
			   my $_obj =  new CHEF::REST::Client::attribute( 
			     					key   => $k , 
			     					value => $self->parse( $param->{ $k } ) 
			     	 	);
				push @{ $self->{ '___collection___'} } , $_obj if defined $_obj; 
			} 
			elsif ( ref $param->{$k} eq 'ARRAY' )
			{
				#my $_obj = new CHEF::REST::Client::attribute( key => $k , value => $param->{$k} );
				return $param->{$k};
			}
			else
			{
				my $_obj =  new CHEF::REST::Client::attribute( 
			     					key   => $k , 
			     					value => $param->{ $k } 
			     	 			);

				push @{ $self->{ '___collection___'} } , $_obj if defined $_obj; 
			}
			
		}
	#return $self->{'___collection___'};
}

1;

__DATA__

=pod

=head1 NAME 

CHEF::REST::Client::attributes

=head1 VERSION

1.0

=head1 SYNOPSIS

 use CHEF::REST::Client::attributes;

  my $obj = new CHEF::REST::Client::attributes( @attributes | %attributes );
     $obj->array_parse( @attributes)
     $obj->parse( %attributes );

=head1 DESCRIPTION

CHEF attributes collection class. used internally

=head1 METHODS

=head2 CHEF::REST::Client::attributes( @attributes | %attributes )

returns new object of class L<CHEF::REST::Client::attributes> with @attributes or %attributes 

=head2 array_parse ( @attributes )

returns list of L<CHEF::REST::Client::attribute> class

=head2 parse ( %attributes )

returns list of L<CHEF::REST::Client::attribute> class

=head1 KNOWN BUGS

=head1 SUPPORT

open a github ticket or email comments to Bhavin Patel <bpatel10@nyit.edu>

=head1 COPYRIGHT AND LICENSE

This Software is free to use , licensed under : The Artisic License 2.0 (GPL Compatible)

=cut