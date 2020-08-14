
# github-synology-sync

A small bash script I use to regularly backup all my GitHub repos to my Synology NAS.

## Instructions

 1. Create an OAuth token
	 1. Go to https://github.com/settings/tokens
	 3. Click the "Personal Access Tokens" tab
	 4. Click "Generate new token"
	 5. Check the scope `read:user`
 2. Drop the script (`github2synology.sh`) somewhere on your NAS
	 1. For example, I dropped it in a `(root)\sourcecode\GitHub` shared folder
 3. Create the scheduled task
	 1. Open Control Panel -> System -> Task Scheduler
	 2. Click Create -> Scheduled Task -> User-defined script
	 3. **General Tab:**
		 1. Give it a name and select your `root` user
		 ![Edit Task](https://www.files.torrobinson.com/captures/2020_08_13_204548_mstsc.png)
	 4. **Schedule Tab:**
		 1. Fill out any schedule as you need
		 ![Schedule Task](https://www.files.torrobinson.com/captures/2020_08_13_204722_mstsc.png)
	 5. **Task Settings Tab**
		 1.  Enter the "Run command" as follows, replacing "sourcecode/GitHub" with the shared folder you created, if different:
		```bash
		bash /volume1/sourcecode/GitHub/github2synology.sh
		``` 
			
		
		![Task Settings](https://www.files.torrobinson.com/captures/2020_08_13_204736_mstsc.png)
		 2. Click "OK" to create the task
		 
 4. Right-click your new User-defined script and click "Run" to immediately run the task.
 ![Run Task](https://www.files.torrobinson.com/captures/2020_08_13_204952_mstsc.png)

