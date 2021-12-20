
# github-synology-sync

A small bash script I use to regularly backup all my GitHub repos to my Synology NAS.

This repo serves mainly as a backup for my solution, should I lose it in the future.

It will use the GitHub API to iterate through all your **owned** public and private repositories, and back up every `master` branch, zipped, onto your Synology NAS.

Due to API limitations, this only backs up the first 100 repositories.

## Instructions

 - [ ] Create an OAuth token
	 - [ ]  Go to https://github.com/settings/tokens
	 - [ ]  Click the "Personal Access Tokens" tab
	 - [ ]  Click "Generate new token"
	 - [ ]  Check the scopes `repo` and `read:user`
	 - [ ]  Create the token and immediately copy and paste it in `github2synology.sh`, into the `OAUTH_TOKEN` variable.
 - [ ]  Drop the script (`github2synology.sh`) somewhere on your NAS
	 - [ ]  For example, I dropped it in a `(root)\sourcecode\GitHub` shared folder
	 - [ ]  Edit `github2synology.sh` and update the `BACKUP_PATH` variable to reflect where you've dropped the script and want your repos backed-up to
 - [ ]  Create the scheduled task
	 - [ ]  Open Control Panel -> System -> Task Scheduler
	 - [ ]  Click Create -> Scheduled Task -> User-defined script
	 - [ ]  **General Tab:**
		 - [ ] Give it a name and select your `root` user
		 
	 - [ ]  **Schedule Tab:**
		 - [ ]  Fill out any schedule as you need
		 
	 - [ ]  **Task Settings Tab**
		 - [ ]   Enter the "Run command" as follows, replacing "sourcecode/GitHub" with the shared folder you created, if different:
		```bash
		bash /volume1/sourcecode/GitHub/github2synology.sh
		``` 
			
		
		 - [ ]  Click "OK" to create the task
		 
 - [ ]  Right-click your new User-defined script and click "Run" to immediately run the task.


