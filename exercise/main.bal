import ballerinax/github;
import ballerina/io;

final string studentName = ?;
final string studentUniversityID = ?;

//TODO: Enter your GitHub personal access token here. 
//      If you haven't a token, please obtain a GitHub personal access token with repo access using the guidelines in
//      https://docs.github.com/en/enterprise-server@3.6/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token
final string githubToken = ?;

int repositoryCount = 0;
string orgName = "ballerina-platform";

public function main() returns error? {
    check starRepository(githubToken);
}

function starRepository(string token) returns error? {
    final github:Client ghClient = check new ({auth: {token}});

    //TODO: Get all the repositories of the organization assign it to a variable named repos.
    //      Hint: Use the getRepositories() function of the ghClient. https://lib.ballerina.io/ballerinax/github/4.6.0#Client-getRepositories
    

    check repos.forEach(function(github:Repository repo) {
        string repoName = repo.name;
        string owner = repo.owner.login;

        //TODO: Star the repository using the starRepository() function of the ghClient and assign it to a variable named starRepository.
        //      https://lib.ballerina.io/ballerinax/github/4.6.0#Client-starRepository
        

        if (starRepository is github:Error) {
            io:println("Error occurred while starring the repo : " + repoName + " " + starRepository.message());
            return;
        }
        io:println("Starred the repo : ", repoName);
        repositoryCount = repositoryCount + 1;
    });
    io:println("Finished processing the org : ", orgName);

    check writeStudentDetails(studentName, studentUniversityID, repositoryCount);
}
