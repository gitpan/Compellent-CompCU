=begin lip

=head1 main.perl

just a temporary test script

=cut

use strict;
use warnings;
use Data::Dump qw(pp);
use Lip::Pod;
use IPC::Cmd qw(can_run run run_forked);

use lib "/Users/ar881/development/users/ar881/usage/Compellent-CompCU/lib";
use Compellent::CompCU qw();

my $cli=new Compellent::CompCU({host=>"compellant1.research.partners.org",
                                user=>"ohai",
                                password=>"0hA1",puke=>"puke",
                                java_path=>"/usr/bin/java",
                                #java_args=>"-client",
                                compcu_path=>"/Users/ar881/Downloads/CU050501_004A/CompCU.jar"});
#my @a=$cli->mapping_show({verbose=>0});
my $success;
my $output=[];
$cli->alert_acknowledge({controller=>8432,index=>6,success=>\$success,output=>$output});
print $success;
print "\n";
print $output->[0];
#$cli->alert_show({success=>\$success,output=>$output});
#$cli->cache_show({success=>\$success,output=>$output});
#$cli->controller_show({success=>\$success,output=>$output, version=>"05.04.04.005", csv=>"puke"});
#$cli->diskfolder_show({success=>\$success,output=>$output, csv=>"puke"});
#$cli->mapping_show({success=>\$success,output=>$output, volumeindex=>47});
#$cli->os_show({success=>\$success,output=>$output, multipath=>"True"});
#$cli->replay_show({success=>\$success,output=>$output, volumeindex=>3});
#$cli->replayprofile_show({success=>\$success,output=>$output, volumeindex=>3});
#$cli->server_show({success=>\$success,output=>$output, parentindex=>6});
#$cli->server_showhba({success=>\$success,output=>$output, server=>7});
#$cli->storageprofile_show({success=>\$success,output=>$output, numvolumes => 39});
#$cli->storagetype_show({success=>\$success,output=>$output, diskfolder=> "Assigned"});
#$cli->system_show({success=>\$success,output=>$output, portsbalanced=> "Yes"});
#$cli->user_show({success=>\$success,output=>$output,showgroupindex=>0});
#$cli->usergroup_show({success=>\$success,output=>$output});
#$cli->volume_show({success=>\$success,output=>$output});
$cli->volumefolder_show({success=>\$success,output=>$output,numvolumes=>4});
print join("\n",@$output);
=end lip

=cut
