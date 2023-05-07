/*
Create a view to summarive January and February performance to show number of
sessions sliced by year and month. Also show utm_sources and utm_campaign.
*/

CREATE VIEW monthly_session AS
SELECT
	year(created_at) as year,
    month(created_at) as month,
    utm_source,
    utm_campaign,
    COUNT(website_session_id) as number_of_session
 FROM website_sessions 
 GROUP BY 1,2,3,4
 ;
 
 
