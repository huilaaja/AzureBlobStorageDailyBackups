<h1>Azure Blob Storage Daily Backups</h1>

<ul>
	<li>Really simple script to automate backups and cleaning old backups.</li>
	<li>Work as well for weekly and monthly backups.</li>
	<li>Uses Azure Blob storage for backups because it's cheap, secure, fast and easily maintainable.</li>
	<li>Azure blob storage prices start from ~2€/100GB/month.</li>
</ul>
<h2>Features</h2>
<ol>
	<li>Zips backup folder and all of it's content.</li>
	<li>Copies zip to blob storage in daily storage.</li>
	<li>Cleans old zip files.</li>
</ol>
<h2>Credits for the tools that scripts uses</h2>
<ul>
	<li>
		AzCopy<br/>
		https://azure.microsoft.com/en-us/documentation/articles/storage-use-azcopy/
	</li>
	<li>
		AzureStorageCleanup<br/>
		https://github.com/nwoolls/AzureStorageCleanup
	</li>
	<li>
		7-Zip<br/>
		http://www.7-zip.org/
	</li>
</ul>