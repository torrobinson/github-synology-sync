
# github-synology-sync

A small bash script I use to regularly backup all my GitHub repos to my Synology NAS.

It will use the GitHub API to iterate through all your public and private repositories, and back up every `master` branch, zipped, onto your Synology NAS.

## Instructions

 - [ ] Create an OAuth token

	 - [ ]  Go to https://github.com/settings/tokens
	 - [ ]  Click the "Personal Access Tokens" tab
	 - [ ]  Click "Generate new token"
	 - [ ]  Check the scopes `repo` and `read:user`
	 - [ ]  Create the token and immediately copy and paste it into `github2synology.sh` into the `OAUTH_TOKEN` variable.
 - [ ]  Drop the script (`github2synology.sh`) somewhere on your NAS
	 - [ ]  For example, I dropped it in a `(root)\sourcecode\GitHub` shared folder
	 - [ ] Edit `github2synology.sh` and update the `BACKUP_PATH` variable to reflect where you've dropped the script and want your repos backed-up to
 - [ ]  Create the scheduled task
	 - [ ]  Open Control Panel -> System -> Task Scheduler
	 - [ ]  Click Create -> Scheduled Task -> User-defined script
	 - [ ]  **General Tab:**
		 - [ ] Give it a name and select your `root` user
		 
		![Edit Task](https://www.files.torrobinson.com/captures/2020_08_13_204548_mstsc.png)
	 - [ ]  **Schedule Tab:**
		 - [ ]  Fill out any schedule as you need
		 
		![Schedule Task](https://www.files.torrobinson.com/captures/2020_08_13_204722_mstsc.png)
	 - [ ]  **Task Settings Tab**
		 - [ ]   Enter the "Run command" as follows, replacing "sourcecode/GitHub" with the shared folder you created, if different:
		```bash
		bash /volume1/sourcecode/GitHub/github2synology.sh
		``` 
			
		
		![Task Settings](https://www.files.torrobinson.com/captures/2020_08_13_204736_mstsc.png)
		 - [ ]  Click "OK" to create the task
		 
 - [ ]  Right-click your new User-defined script and click "Run" to immediately run the task.
 ![Run Task](https://www.files.torrobinson.com/captures/2020_08_13_204952_mstsc.png)


