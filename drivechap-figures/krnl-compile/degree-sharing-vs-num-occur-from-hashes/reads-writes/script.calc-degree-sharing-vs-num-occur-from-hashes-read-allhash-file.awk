#!/usr/bin/awk

BEGIN {

}

{
	
	if ($1 in occur)
		occur[$1]++
	else
		occur[$1] = 1

	if ($1 in sharing)
	{
		regex=$2
		if (0 == match(sharing[$1], regex))
		{
			sharing[$1] = sharing[$1] ":" $2	
			num_sharing[$1]++
		}
	}
	else
	{
		sharing[$1] = $2
		num_sharing[$1] = 1
	}
}

END {
    iter=0
    for (key in occur)
    {
        print iter, key, num_sharing[key], occur[key]
        iter++
    }
#        command="j=`echo "sharing[key]"| sed \"s/:/\\n/g\" |sort -n|uniq`; data=$(echo -n \"${j}\"); echo $data"
#        command | getline set
#        close(command);
   #     command="echo "sharing[key]"| sed \"s/:/\\n/g\" |sort -n|uniq|wc -l"
   #     command | getline num_sharing
   #     close(command);
#        print iter, key, occur[key], num_sharing, sharing[key], set
}

