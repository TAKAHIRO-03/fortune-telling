#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use Mojolicious::Lite;
use Data::Dumper;
use Encode qw/encode decode/;
require "./model/Get_text.pm";
require "./model/search_img.pm";

get '/' => sub{
    my $self = shift;
    $self->render('index');
};

get '/result' => sub{
    my $self = shift;
    my $profile = GET_text::open_file();
    my @profile_del = keys %$profile;
    my $img_url = Serch_img::get_img_url($profile_del[0]);
    
    $self->stash(profile => $profile);
    $self->stash(img_url => $img_url);   
    $self->render('result');
};

app -> start;