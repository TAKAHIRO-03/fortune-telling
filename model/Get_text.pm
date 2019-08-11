package GET_text;
use strict;
use warnings;
use utf8;
use Data::Dumper;

# コンストラクタ  new(x=0.0)
# sub new {
#   my $self = shift;
#   return $self;
# }

sub open_file {
    my $filename = '/Users/takachanman/Desktop/git_dev/fortune telling/model/info.txt';
    my $human_number = int(1 + rand 4) - 1;
    open FILE, $filename
        or die "Can't open '$filename' : $!";
    chomp(my $string = <FILE>);
    # my @strings = split (/:\W+,/, $string);
    my @strings = split (/,/, $string);
    
    my @human;
    my $sub_judge;
    my @subtitle;
    my $profile = {};

    foreach (@strings){
        if($_ =~ s/:\W+//){
          push @human, $_;
          $sub_judge = $&;
            if($sub_judge =~ s/://){
              push @subtitle , $';
            }
        }
    }
    $profile->{$human[$human_number]} = $subtitle[$human_number];
    return $profile;
}

1;