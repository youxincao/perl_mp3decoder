# For Test 
@ARGV = ("E:\\sample\\paomo.mp3") ;

#Test The input args 
$num_args = $#ARGV + 1;
if( $num_args != 1 )
{
	print "\nUsage: Mp3Decoder.pl [filename] \n";
	exit ;
}
$filename = @ARGV[0];

open(INFILE, "<", $filename) or die "Not able to open file($filename) \n";
binmode(INFILE);

# read the id3v2 tag header
read(INFILE, $buf , 10) ;
$tagName = pack("a3", $buf);
if($tagName == "ID3" ) 
{
	# find ID3 Tag header skip it
	@list = unpack("C10", $buf) ;
	print @list[8] . "\n" ;
	print @list[9] . "\n" ;
	$id3_tag_len = ((@list[6]&0xFF)<<21)|((@list[7]&0xFF)<<14)|((@list[8]&0xFF)<<7)|(@list[9]&0xFF) + 10;

	print $id3_tag_len ."\n" ;
}

close(INFILE) or die "Not able to close the file($filename) \n" ;