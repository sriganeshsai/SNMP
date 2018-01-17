use NetSNMP::agent (':all');
use NetSNMP::OID (':all');
use NetSNMP::ASN (':all');


my $agent = new NetSNMP::agent();
$agent->register("subagent.pl", "1.3.6.1.4.1.4171.40", \&function);

sub function
{
my ($handler, $registration_info, $request_info, $requests) = @_;
my $request;
for($request = $requests; $request; $request = $request->next()) 
{
my $oid = $request->getOID();
if ($request_info->getMode() == MODE_GET)
{        
if ($oid == new NetSNMP::OID("1.3.6.1.4.1.4171.40.1"))
{
$request->setValue(ASN_COUNTER,time);
}
if ($oid > new NetSNMP::OID("1.3.6.1.4.1.4171.40.1")) 
{
my @las = split /[.]/,$oid;
my $last = $las[-1];
$last--;
open(FILE, "</tmp/t1/counters.conf") or die "Couldn't read the counter values, $!";
while(<FILE>)
{
my $line = $_;
my @c_values = split /[,]/,$line;
my $l = @c_values[-2];
if($last == $l)
{
my $c = @c_values[-1];
my $y = time * $c;
# if the value exceed 32 bit value 
my $max = (2**31) - 1 ;
if ($y > $max)
{
my $lower32 = $y & 0x00000000FFFFFFFF;
$request->setValue(ASN_COUNTER,$lower32);
}
else
{
$request->setValue(ASN_COUNTER,$y);
}
}
}
close(FILE);
}
}
}
}


