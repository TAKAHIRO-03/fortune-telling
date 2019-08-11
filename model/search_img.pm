package Serch_img;
use strict;
use warnings;
use utf8;
use Data::Dumper;
use Encode qw/encode decode/;
use LWP::UserAgent;
use HTML::TreeBuilder;

sub get_img_url {
    my $target = shift;
    my $number = int (1 + rand 20) - 1;
    my @photo_list;
    my $url     =    "https://www.google.co.jp/search?hl=ja&authuser=0&tbm=isch&source=hp&biw=1440&bih=789&ei=P49OXai-PICTr7wPo7WfyA4&q=".
                     "$target".
                     "&oq=".
                     "$target".
                     "&gs_l=img.3..0l10.2672.4073..4349...0.0..0.183.1687.2j11......0....1..gws-wiz-img.....0..0i4.TBYFwiZgKFU&ved=0ahUKEwjo2cjK__fjAhWAyYsBHaPaB-kQ4dUDCAU&uact=5";

    my $ua      = 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)';
    my $timeout = '10';
    my $lwp = LWP::UserAgent->new( agent => $ua, timeout => $timeout );
    
    ## コンテンツの取得
    my $res = $lwp->get( $url );
 
    ## コンテンツの取得成功時
    if ( $res->is_success ) {
 
        ## TreeBuilder でコンテンツを解析
        my $tree = HTML::TreeBuilder->new;
        $tree->parse( $res->content );
        $tree->eof();

        ## 解析データの取得処理
        foreach ( $tree->find('img') ) {
            
            # print decode('UTF-8' , $_->as_text) . "\n";
            # print $_ -> as_text ."\n";
            # print $_->attr('src') . "\n";
            push @photo_list , $_->attr('src');
        }
 
        ## 解析が終わったらデータをクリア
        $tree = $tree->delete;
 
    ## コンテンツの取得失敗時
    } else {
        print "get error\n";
    }
    return $photo_list[$number];
}

1;