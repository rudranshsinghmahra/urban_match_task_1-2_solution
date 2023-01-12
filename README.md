# UrbanMatch Task 1 and 2 Solution

Task 1 - Connect to the Github API
Connect to the Github API to retrieve the list of public repositories in your Github Account.
Alternatively, use this account: https://api.github.com/users/freeCodeCamp/repos

This results in a list of public Repositories. Visualize the results in a List View. You are free to
choose any meaningful subset of data to show in each row.

Task 2 - Asynchronously load the last commit
Once the list has been populated, start retrieving information about the last commit for each
repository.
This can be done with the following call:
https://api.github.com/repos/freeCodeCamp/1Aug2015GameDev/commits
Where “freeCodeCamp” (see Task 1) is the user and “1Aug2015GameDev” the repository under
consideration. Again, feel free to choose any meaningful subset of data to add to the row upon a
successful response. Make sure that the list is scrollable while data is loading.