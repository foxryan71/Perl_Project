#!/usr/bin/perl
use 5.010;
sub menu{
	&openFile();
		

	my $prevchoice;
	do{
	print"MENU \n";
	print"============================ \n";
	print"(p, P) print users info \n";
	print"(a, A) Add new user \n";
	print"(s, S) Search user \n";
	print"(d, D) Delete user \n";
	print"(x, X) Exit \n";
	
	print"please enter a choice: \n";
	chomp($prevchoice =<STDIN>);
	my $choice = lc($prevchoice);
	if($choice eq "p"){
		&print();
		
	}
	elsif($choice eq "a"){
		&addNewUser;
	}
	elsif($choice eq "s"){
		&searchUser();
	}
	elsif($choice eq "d"){
		&deleteUser();
	}
	elsif ($choice eq "x"){
		exit 0;
	}
	else{
		print"Invalid OPTION! \n";
	}
	
}while($choice ne 'x' | 'X');

}

sub openFile{
	$myFile  = $ARGV[0];
	open (INFILE,'<', $myFile);
	unless(-e $myFile)
	{
		print"File doesn't exist making new file called: $myFile !\n";
		open (INFILE,'>', $myFile);
	}
	close INFILE;	
}




sub addNewUser{

$firstName;
$lastName;

$myFile = $ARGV[0];
open(OUTFILE, '>>', $myFile);

print "\n Add New User Menu \n";
print"========================== \n";


print"Please enter the first name of the user you'd like to add: \n";
chomp($firstName = <STDIN>);


print "Please now enter the last name of the user you'd like to add \n";
chomp($lastName = <STDIN>);
	
 if(open OUTFILE, '>>', $myFile){
	
	if($firstName eq undef){
		print"You cannot enter a empty string!\n";
		return;
	}
	if($lastName eq undef){
		print"you cannot enter a empty string! \n";
		return;
	}

	$first = substr($firstName,0,1);
	$last = substr($lastName,0,4);
	$userName = $first . $last;
	$ucFirstName = uc($firstName);
	$ucLastName = uc($lastName);
	$ucUserName = uc($userName);
	open(INFILE,'<',$myFile);
	if(open INFILE,'<',$myFile){

		while(<INFILE>){

			if(/$ucUserName/){

				$ucUserName .="1";
			}
		}

	}	
	
	print"first name: $firstName \n";
	print"last name: $lastName \n";
	print "user name will be $ucUserName \n";

	say OUTFILE"$ucFirstName:$ucLastName:$ucUserName";
	
	close OUTFILE;
	close INFILE;
	
}

}

sub searchUser{
	 $name;
	
	$myFile = $ARGV[0];
	open(INFILE, '<', $myFile);
	if(open INFILE, '<', $myFile){
	print"Search User \n";
	print"======================== \n";	
	print"Please enter the first name: \n";
	chomp($name = <STDIN>);
	$firstName = uc($name);
		
	printf("%-15s %-15s %-15s \n","First Name","Last Name","Username");
	print"===========================================================\n";
	while(<INFILE>){
		
		(my $first,my $last, my $user) = split/:/,$_;	
		if($firstName =~ $first){
			
			printf("%-15s %-15s %-15s\n",$first,$last,$user);	
		}	
		
	}
	}
	close INFILE;
}

sub print{
	
	$myFile = $ARGV[0];
	open(INFILE,'<',$myFile);
	if(open INFILE, '<', $myFile){
	@fileLine = <INFILE>;
	@sorted = sort(@fileLine);
	printf("%-15s %-15s %-15s \n","Username","First Name","Last Name");
	print"==============================================================\n";
	foreach $line(@sorted){
	chomp($line);	
	(my $firstName,my $lastName,my $userName) = split/:/,$line;
	printf("%-15s %-15s %-15s\n",$userName,$firstName,$lastName);
	}
	}
	close INFILE;
}

sub deleteUser{
	$name;
	print"Delete User \n";
	print"=======================================\n";
	print"Please enter the first name you'd like to delete \n";
	chomp($name =<STDIN>);
	$firstName = uc($name);
	$myFile = $ARGV[0];
	open(INFILE,'<', $myFile);
	@LINES = <INFILE>;
	close INFILE;
	open(INFILE,'>',$myFile);
	foreach my $LINE(@LINES){
	(my $first, my $last, my $user) = split/:/,$LINE;
	print INFILE $LINE unless($firstName =~ $first);
	
	if($firstName =~ $first){
		print"You've deleted the record:$LINE \n";
	}
	}
	close INFILE;	
	}

	
	



&menu();

