# DatabaseHW4
Assignment4 with queries and explanation

# Question 1: Retrieve Customer Last Names and Emails:
This query retrieves the last names and email addresses of customers who have made purchases.
It achieves this by joining the "customers" table with the "invoices" table using the "CustomerId" column.
The WHERE clause filters out customers with NULL email addresses.

# Question 2: Retrieve Album Names and Artist Names:
This query retrieves the names of albums along with the corresponding names of the artists who created them.
It accomplishes this by joining the "albums" table with the "artists" table using the "ArtistId" column.

# Question 3: Count Total Customers per State:
This query counts the total number of unique customers for each state and orders the results alphabetically by state.
It groups the data by state and counts the number of distinct customer IDs.

# Question 4: List States with More than 10 Unique Customers:
This query lists states with more than 10 unique customers.
It achieves this by using a HAVING clause after grouping the data by state to filter states with more than 10 unique customers.

# Question 5: Retrieve Artists with "Symphony" in Album Title:
This query retrieves the names of artists who have albums containing the substring "symphony" in the title.
It joins the "artists" table with the "albums" table and filters the results based on the album title.

# Question 6: Retrieve Artists who Performed MPEG Tracks in Specific Playlists:
This query retrieves the names of artists who performed MPEG tracks in either the "Brazilian Music" or the "Grunge" playlists.
It joins multiple tables including "artists", "albums", "tracks", "media_types", "playlist_track", and "playlists" to filter for specific conditions.

# Question 7: Count Artists with at Least 10 MPEG Tracks:
This query counts the number of artists who have published at least 10 MPEG tracks.
It uses a subquery to count the number of MPEG tracks published by each artist and filters for those who have at least 10 such tracks.

# Question 8: List Playlists Longer than 2 Hours:
This query lists the playlists that are longer than 2 hours along with their total length in hours.
It calculates the total length of each playlist in hours and filters the results to include only those playlists longer than 2 hours.

# Question 9: Retrieve Customer Invoices with Total Amount Spent:
This query retrieves information about each customer's invoices, including the total amount spent by each customer.
It calculates the total amount spent by each customer using a window function and partitions the data by customer ID.
