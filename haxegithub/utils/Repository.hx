package haxegithub.utils;

/**
 * Github Repository Util
 */
class Repository {
	/**
	 * Return the Repository JSON
	 * @param user 
	 * @param repo 
	 * @return Dynamic
	 */
	public static function get(user:String, repo:String):Dynamic {
		var api = new GithubAPI();
		api.request('repos/$user/$repo');
		return api.json;
	}

	/**
	 * Return the Commits JSON
	 * @param user 
	 * @param repo 
	 * @return Dynamic
	 */
	public static function getCommits(user:String, repo:String):Dynamic {
		var api = new GithubAPI();
		api.request('repos/$user/$repo/commits');
		return api.json;
	}

	/**
	 * get Contributors from a Repository
	 * @param user 
	 * @param repo 
	 * @return Array<Dynamic>
	 */
	public static function getContributors(user:String, repo:String):Array<Dynamic> {
		var api = new GithubAPI();
		api.request('repos/$user/$repo/contributors');
		return api.json;
	}

	/**
	 * get Collaborators from a Repository, Requires a Token!
	 * @param token
	 * @param user 
	 * @param repo 
	 * @return Array<Dynamic>
	 */
	public static function getCollaborators(token:String, user:String, repo:String):Array<Dynamic> {
		var api = new GithubAPI(token);
		api.request('repos/$user/$repo/collaborators');
		return api.json;
	}

	/**
	 * get releases from a Repository
	 * @param user 
	 * @param repo 
	 * @param latest
	 * @return Dynamic
	 */
	public static function getReleases(user:String, repo:String, ?latest:Bool = false):Dynamic {
		var api = new GithubAPI();
		api.request('repos/$user/$repo/releases' + (latest ? '/latest' : ''));
		return api.json;
	}

	/**
	 * get forks from a Repository
	 * @param user 
	 * @param repo 
	 * @return Array<Dynamic>
	 */
	public static function getForks(user:String, repo:String):Array<Dynamic> {
		var api = new GithubAPI();
		api.request('repos/$user/$repo/forks');
		return api.json;
	}

	/**
	 * get stars from a Repository
	 * @param user 
	 * @param repo 
	 * @return Array<Dynamic>
	 */
	public static function getStarred(user:String, repo:String):Array<Dynamic> {
		var api = new GithubAPI();
		api.request('repos/$user/$repo/starred');
		return api.json;
	}

	/**
	 * get languages from a Repository
	 * @param user 
	 * @param repo 
	 * @return Dynamic
	 */
	public static function getLanguages(user:String, repo:String):Dynamic {
		var api = new GithubAPI();
		api.request('repos/$user/$repo/languages');
		return api.json;
	}

	/**
	 * get events from a Repository
	 * @param user 
	 * @param repo 
	 * @param issue
	 * @return Array<Dynamic>
	 */
	public static function getEvents(user:String, repo:String, ?issue:Bool = false):Array<Dynamic> {
		var api = new GithubAPI();
		api.request('repos/$user/$repo' + (issue ? '/issues' : '') + '/events');
		return api.json;
	}

	/**
	 * get issues from a Repository
	 * @param user 
	 * @param repo 
	 * @return Array<Dynamic>
	 */
	public static function getIssues(user:String, repo:String):Array<Dynamic> {
		var api = new GithubAPI();
		api.request('repos/$user/$repo/issues');
		return api.json;
	}

	/**
	 * get branches from a Repository
	 * @param user 
	 * @param repo 
	 * @param branche 
	 * @return Dynamic
	 */
	public static function getBranches(user:String, repo:String, ?branche:String):Dynamic {
		var api = new GithubAPI();
		api.request('repos/$user/$repo/branches' + (branche != null ? '/$branche' : ''));
		return api.json;
	}
}
